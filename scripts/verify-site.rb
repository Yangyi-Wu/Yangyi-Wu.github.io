require "nokogiri"
require "yaml"
require "date"
require "pathname"
require "open3"
require "set"
require "json"
require "uri"

root = Pathname.new(ARGV.fetch(0, "_site"))
node = ENV.fetch("NODE_EXE", "node")
records = YAML.safe_load_file("_data/publication_records.yml")
themes = YAML.safe_load_file("_data/publication_themes.yml")
scholar = YAML.safe_load_file("_data/scholar.yml")
publication_categories = YAML.safe_load_file("_config.yml", aliases: true).fetch("publication_category")
publications = {}
checked_scripts = Set.new

def check(condition, message)
  raise message unless condition
end

def html(root, path)
  candidates = [root.join(path.delete_prefix("/")), root.join(path.delete_prefix("/") + ".html"), root.join(path.delete_prefix("/"), "index.html")]
  file = candidates.find(&:file?)
  raise "Missing page: #{path}" unless file
  Nokogiri::HTML(File.read(file, encoding: "UTF-8"))
end

def check_navigation(page, path)
  chinese = path.start_with?("/zh/")
  prefix = chinese ? "/zh" : ""
  slugs = %w[about research people publications join]
  links = page.css("#site-nav .masthead__menu-item:not(.persist) a")
  check(links.map { |a| a["href"] } == slugs.map { |slug| "#{prefix}/#{slug}/" }, "Expected five primary sections: #{path}")
  titles = chinese ? %w[课题组 研究方向 团队成员 论文成果 学术交流与招生] : ["About", "Research", "People", "Publications", "Exchange and Admissions"]
  check(links.map(&:text) == titles, "Incorrect localized navigation labels: #{path}")
  brand = page.at_css("#site-nav .masthead__menu-item--lg a")
  check(brand["href"] == (chinese ? "/zh/" : "/en/"), "Brand must return to the localized homepage: #{path}")
  check(page.at_css(".footer-archive a")["href"] == "#{prefix}/news/", "Missing news archive access: #{path}")
  local_path = path.delete_prefix(prefix)
  parent = {"/projects/" => "/research/", "/cv/" => "/people/"}[local_path]
  parent = "/publications/" if local_path.start_with?("/publication/")
  active = page.css("#site-nav a[aria-current]")
  if parent
    check(active.length == 1 && active.first["href"] == "#{prefix}#{parent}" && active.first["aria-current"] == "location", "Incorrect parent navigation: #{path}")
  elsif slugs.any? { |slug| local_path == "/#{slug}/" }
    check(active.length == 1 && active.first["href"] == path && active.first["aria-current"] == "page", "Incorrect current page: #{path}")
  else
    check(active.empty?, "Unrelated section highlighted: #{path}")
  end
end

scholar_records = scholar.fetch("publications")
check(themes.keys.sort == records.keys.sort, "Incomplete publication theme assignments")
check(themes.values.all? { |ids| !ids.empty? && (ids - %w[transformation restructuring inequality methods]).empty? }, "Invalid research theme")
check(scholar_records.keys.sort == records.keys.sort, "Scholar and publication records differ")
check(scholar_records.length == scholar.fetch("publication_count"), "Incomplete Scholar snapshot")
check(scholar_records.values.map { |record| record.fetch("id") }.uniq.length == scholar_records.length, "Duplicate Scholar article IDs")

Dir.glob("_publications/*.md").each do |source|
  data = YAML.safe_load(File.read(source, encoding: "UTF-8").split(/^---\s*$\n?/)[1], permitted_classes: [Date, Time])
  record = records.fetch(File.basename(source, ".md"))
  scholar_record = scholar_records.fetch(File.basename(source, ".md"))
  check(data.fetch("date").year == scholar_record.fetch("year"), "Scholar year mismatch: #{source}")
  english_path = data.fetch("permalink")
  publications[english_path] = data.merge(record)
  ["en", "zh"].each do |language|
    path = language == "zh" ? "/zh#{english_path}" : english_path
    page = html(root, path)
    check_navigation(page, path)
    check(page.at_css("html")["lang"] == language, "Wrong language: #{path}")
    check(page.at_css(".publication-authors").text == record.fetch("authors"), "Missing authors: #{path}")
    scholar_url = "https://scholar.google.com/citations?view_op=view_citation&user=#{scholar.fetch('profile_id')}&citation_for_view=#{scholar.fetch('profile_id')}:#{scholar_record.fetch('id')}"
    check(page.css(".publication-links a").any? { |link| link["href"] == scholar_url }, "Wrong Scholar record link: #{path}")
    alternate = page.at_css("[data-language-option]")
    target = language == "zh" ? english_path : "/zh#{english_path}"
    check(alternate && alternate["href"] == target, "Wrong language counterpart: #{path}")
    nav_paths = page.css("#site-nav a[href]").reject { |a| a["data-language-option"] }.map { |a| a["href"] }
    check(nav_paths.all? { |p| language == "zh" ? p.start_with?("/zh/") : !p.start_with?("/zh/") }, "Mixed navigation: #{path}")
    check(page.css("[data-publication-lang]").empty?, "Language still depends on hiding text: #{path}")
    if record["doi"]
      check(page.css(".publication-links a").any? { |a| a["href"] == "https://doi.org/#{record['doi']}" }, "Missing DOI: #{path}")
    end
    check(page.css(".publication-figure").length == (record["visual_reviewed"] ? 1 : 0), "Unreviewed illustration: #{path}")
    headings = page.css(".page__content h2").map(&:text)
    check(headings.length == (record["summary_reviewed"] ? 2 : 0), "Unreviewed summary: #{path}")
  end
end

["/publications/", "/zh/publications/"].each do |path|
  page = html(root, path)
  check_navigation(page, path)
  cards = page.css(".publication-entry")
  check(cards.length == records.length, "Incomplete publication list: #{path}")
  check(page.css("[data-publication-count]").length == 1 && page.at_css(".publication-toolbar [data-publication-count]"), "Publication count must appear once, alongside its filters: #{path}")
  check(page.at_css("[data-publication-count]").text.start_with?(records.length.to_s), "Missing no-JS publication count: #{path}")
  links = cards.map { |entry| entry.at_css("h3 a")["href"] }
  check(links.uniq.length == records.length, "Duplicate publications: #{path}")
  groups = page.css(".publication-group")
  check(groups.map { |group| group["data-publication-category"] } == publication_categories.keys, "Unexpected publication grouping: #{path}")
  groups.each do |group|
    category = group["data-publication-category"]
    title_key = path.start_with?("/zh/") ? "title_zh" : "title"
    check(group.at_css("h2").text == publication_categories.fetch(category).fetch(title_key), "Wrong category heading: #{path}")
    actual = group.css(".publication-entry h3 a").map { |link| link["href"].delete_prefix("/zh") }
    expected = publications.select { |_, record| record.fetch("category") == category }.sort_by { |_, record| record.fetch("date") }.reverse.map(&:first)
    check(actual == expected, "Incomplete or non-chronological category #{category}: #{path}")
  end
  check(page.css(".publication-media, .publication-entry img").empty?, "Publication list must be text-only: #{path}")
  cards.each do |entry|
    check(!entry["data-publication-themes"].to_s.empty?, "Missing publication themes")
    media = entry.at_css(".publication-media")
    check(media.nil? || media["href"] == entry.at_css("h3 a")["href"], "Image/title language mismatch")
  end
  bytes = page.css(".publication-entry img").sum do |img|
    check(img["loading"] == "lazy" && img["srcset"] && img["width"] && img["height"], "Missing responsive image attributes")
    root.join(img["src"].delete_prefix("/")).size
  end
  check(bytes < 1_000_000, "Publication default images exceed 1 MB: #{bytes}")
  puts "#{path}: #{cards.length} publications; default images #{bytes} bytes"
end

entry_page = html(root, "/")
mark = Nokogiri::XML(root.join("images/favicon.svg").read)
check(mark.at_xpath("//*[local-name()='title']").text == "UTSI", "Missing UTSI brand icon")
manifest = JSON.parse(root.join("images/manifest.json").read)
check(manifest.fetch("short_name") == "UTSI", "Legacy template app identity remains")
manifest.fetch("icons").each do |icon|
  check(root.join("images", icon.fetch("src").split("?").first).file?, "Missing app icon")
end
check(entry_page.at_css("html")["data-language-entry"] == "true", "Missing language entry")
check(entry_page.at_css(".group-wordmark") && entry_page.at_css(".site-city-photo"), "Language entry must use the group identity and licensed city photograph")
check(entry_page.css("[data-language-option]").map { |a| a["href"] }.sort == %w[/en/ /zh/], "Chooser must have working no-JS links")
%w[/en/ /zh/ /about/ /zh/about/ /projects/ /zh/projects/ /people/ /zh/people/ /news/ /zh/news/ /join/ /zh/join/ /research/ /zh/research/ /team/ /zh/team/ /cv/ /zh/cv/ /talks/ /zh/talks/].each do |path|
  page = html(root, path)
  check_navigation(page, path)
  icons = page.css('link[rel="icon"], link[rel="apple-touch-icon"]')
  check(icons.length == 4 && icons.all? { |icon| icon["href"].include?("v=utsi-20260927") }, "Missing versioned site icons: #{path}")
  icons.each { |icon| check(root.join(URI.parse(icon["href"]).path.delete_prefix("/")).file?, "Missing favicon asset") }
  check(page.at_css("[data-language-option]"), "Missing language switch: #{path}")
  check(page.css("script[src]").none? { |script| script["src"].match?(/mathjax|plotly|polyfill/) }, "Unneeded diagram engine on a main page: #{path}")
  expected_alternate = path.start_with?("/zh/") ? path.delete_prefix("/zh") : "/zh#{path}"
  expected_alternate = "/en/" if path == "/zh/"
  expected_alternate = "/zh/" if path == "/en/"
  check(page.at_css("[data-language-option]")["href"] == expected_alternate, "Wrong paired route: #{path}")
  tails = page.css("#site-nav .persist.tail")
  check(tails.length == 1 && tails.first.at_css("[data-language-option]"), "Unstable navigation order after resizing: #{path}")
  menu_button = page.at_css("#site-nav button.nav-toggle")
  check(menu_button && menu_button["type"] == "button" && menu_button["aria-expanded"] == "false", "Missing accessible menu control: #{path}")
  check(page.at_css("##{menu_button['aria-controls']}.hidden-links"), "Menu control has no matching dropdown: #{path}")
  check(page.at_css("#theme-toggle button[type='button'][title][aria-label]"), "Theme control must support native keyboard activation: #{path}")
  page.css("#main a[href], #site-nav a[href]").each do |link|
    href = link["href"].split(/[?#]/).first
    next unless href && href.start_with?("/")
    html(root, href) unless File.extname(href).match?(/\.(png|webp|jpg|pdf)$/)
  end
end

homepage = YAML.safe_load_file("_data/homepage.yml")
research = YAML.safe_load_file("_data/research.yml")
selection = homepage.fetch("selection")
current_year = Date.today.year
first_year = current_year - selection.fetch("recent_years") + 1
role_labels = {
  "first" => {"en" => "First author", "zh" => "第一作者"},
  "corresponding" => {"en" => "Corresponding author", "zh" => "通讯作者"},
  "co_corresponding" => {"en" => "Co-corresponding author", "zh" => "共同通讯作者"}
}
["en", "zh"].each do |language|
  prefix = language == "zh" ? "/zh" : ""
  page = html(root, language == "zh" ? "/zh/" : "/en/")
  check(page.at_css(".group-home-title") && page.css(".sidebar").empty?, "Missing group homepage identity")
  check(page.css("link[rel='stylesheet']").any? { |link| link["href"].match?(%r{/assets/css/main\.css\?v=\d+$}) }, "Missing stylesheet cache version")
  check(page.css("script[src]").any? { |script| script["src"].match?(%r{/assets/js/main\.min\.js\?v=\d+$}) }, "Missing navigation script cache version")
  font_preload = page.at_css("link[rel='preload'][as='font']")
  check(font_preload && font_preload["href"].match?(%r{/assets/webfonts/utsi/utsi-sans\.woff2\?v=\d+$}), "Missing font cache version")
  check(root.join("assets/css/main.css").read.include?(font_preload["href"].split("/").last), "Font preload and stylesheet versions differ")
  check(page.at_css(".home-hero .home-identity") && page.css(".urban-cover").empty?, "Homepage must use the institutional identity")
  city_photo = page.at_css(".home-hero .site-city-photo")
  check(city_photo && city_photo["fetchpriority"] == "high" && city_photo["srcset"], "Missing responsive hero photograph")
  check(city_photo["src"] != entry_page.at_css(".site-city-photo")["src"], "Home and entry should use distinct city photographs")
  check(city_photo["src"] == YAML.safe_load_file("_data/site_visual.yml").fetch("home_photo").fetch("large"), "Wrong homepage photograph")
  check(root.join(city_photo["src"].delete_prefix("/")).size < 500_000, "Hero photograph exceeds image budget")
  check(page.css(".photo-credit a").length == 2, "Missing photographer and license credits")
  check(root.join("assets/webfonts/utsi/utsi-sans.woff2").size < 1_500_000, "Site font exceeds budget")
  check(page.css(".home-highlights-grid .home-highlight").length == 2, "Missing editorial highlights layout")
  check(page.css(".home-highlight img").length == homepage.fetch("highlights").length, "Missing homepage visuals")
  projects = html(root, "#{prefix}/projects/")
  check(projects.css(".group-project").length == 4, "Missing verified projects")
  check(html(root, "#{prefix}/people/").at_css(".group-person img"), "Missing PI profile")
  students = YAML.safe_load_file("_data/students.yml")
  people = html(root, "#{prefix}/people/")
  check(people.css(".group-student").length == students.length, "Missing student profiles: #{language}")
  check(students.map { |student| student.fetch("id") }.sort == %w[d deng l q t x y yin z], "Incorrect student roster")
  { "t" => ["T 同学", "Y. T."], "x" => ["X 同学", "Q. X."], "y" => ["Y 同学", "Z. Y."] }.each do |id, names|
    student = students.find { |member| member.fetch("id") == id }
    check(student.fetch("name_#{language}") == names[language == "zh" ? 0 : 1], "Incorrect localized anonymous display name")
  end
  check(people.css(".group-student-grid").length == 2, "Missing two-column member groups")
  check(people.css(".people-sections a").all? { |a| people.at_css(a["href"]) }, "Broken people section navigation")
  %w[王小明 李小华 滕雅婷 谢强].each do |name|
    check(!people.at_css(".group-page-body").text.include?(name), "Example or non-public display name on people page")
  end
  check(students.all? { |student| %w[current alumni].include?(student.fetch("status")) }, "Unknown student status")
  %w[current alumni].each do |status|
    check(people.css("[data-student-group='#{status}'] .group-student").length == students.count { |student| student.fetch("status") == status }, "Incorrect #{status} student grouping: #{language}")
  end
  students.each do |student|
    profile = people.at_css("[data-student='#{student.fetch('id')}']")
    check(profile.at_css("h3").text == student.fetch("name_#{language}"), "Incorrect display name")
    check(profile.at_css(".group-meta").text == student.fetch("cohort_#{language}"), "Incorrect student cohort")
    check(profile.css("li").map(&:text) == student.fetch("details_#{language}"), "Incorrect student details")
    expected_years = [student.fetch("joined"), student["left"]].compact.map(&:to_s)
    check(profile.css(".group-period time").map(&:text) == expected_years, "Incorrect time with the group")
    check(student.fetch("joined").is_a?(Integer), "Missing verified joining year")
    if student["dest_#{language}"]
      dest = profile.at_css(".group-dest")
      check(dest && dest.text == student.fetch("dest_#{language}"), "Incorrect student destination")
    end
    if student["quote_#{language}"]
      quote = profile.at_css(".group-quote")
      check(quote && quote.text.include?(student.fetch("quote_#{language}")), "Incorrect student quote")
      reflection = profile.at_css("details.group-reflection")
      check(reflection && !reflection.key?("open") && reflection.at_css("summary"), "Personal reflection must be accessible and initially collapsed")
    end
    if student["photo"]
      photo = profile.at_css(".group-student-id img")
      check(photo && photo["src"] == student.fetch("photo") && photo["alt"] == student.fetch("name_#{language}"), "Incorrect student photo")
      check(root.join(photo["src"].delete_prefix("/")).size < 300_000, "Student photo exceeds image budget")
    end
    if student["paper"]
      check(publications.key?(student["paper"]), "Unknown student publication")
      check(profile.at_css("a")["href"] == "#{prefix}#{student['paper']}", "Wrong student paper language")
    else
      check(profile.css("a").empty?, "Unverified student publication link")
    end
  end
  expected_cohorts = YAML.safe_load_file("_data/group.yml").fetch("admissions").map { |cohort| cohort.fetch("year") }
  join_page = html(root, "#{prefix}/join/")
  values = YAML.safe_load_file("_data/group.yml").fetch("research_values")
  check(join_page.css(".join-value h3").map(&:text) == %w[Understand Think Study Inspire], "Incorrect UTSI research and growth principles")
  check(join_page.css(".join-value-label").map(&:text) == values.map { |value| value.fetch("label_#{language}") }, "Incorrect translated principle labels")
  check(join_page.css(".join-value-description").map(&:text) == values.map { |value| value.fetch("description_#{language}") }, "Incorrect translated principle descriptions")
  join_order = join_page.css(".group-page-body > .group-intro, .group-page-body > .group-admissions, .group-page-body > .group-section, .group-page-body > .join-values").map { |element| element["class"].split.first }
  check(join_order == %w[group-intro group-admissions group-section group-section join-values group-section], "Join page sections out of order")
  join_copy = YAML.safe_load_file("_data/group.yml").fetch(language)
  check(join_page.css(".group-section p").any? { |p| p.text == join_copy.fetch("assistant") }, "Missing research assistant note")
  check(join_page.css(".group-section p").any? { |p| p.text == join_copy.fetch("exchange") }, "Missing academic exchange note")
  check(html(root, "#{prefix}/join/").css(".group-admissions dt").map(&:text) == expected_cohorts, "Admissions page differs from shared data")
  check(page.at_css(".profile-lead").text == homepage.fetch(language).fetch("lead"), "Wrong homepage introduction: #{language}")
  check(page.at_css(".home-section-label h2").text == homepage.fetch(language).fetch("perspective_title"), "Wrong research perspective heading: #{language}")
  check(page.at_css(".home-introduction-lead").text == homepage.fetch(language).fetch("introduction"), "Intro layout changed the lead copy")
  group_data = YAML.safe_load_file("_data/group.yml").fetch(language)
  pi_profile = page.at_css("#home-pi")
  check(pi_profile && pi_profile.at_css("h2").text == group_data.fetch("pi_name"), "Missing homepage PI identity")
  check(pi_profile.at_css("img")["src"] == people.at_css(".group-person img")["src"], "Homepage must use the approved PI photograph")
  check(pi_profile.at_css(".home-pi-role").text.include?(group_data.fetch("pi_role")) && pi_profile.at_css(".home-pi-role").text.include?(group_data.fetch("affiliation")), "Missing PI role or affiliation")
  check(pi_profile.at_css(".home-pi-bio").text == group_data.fetch("pi_bio"), "PI biographies must stay consistent")
  check(page.at_css(".home-pi a")["href"] == "#home-pi", "Hero identity must link to the PI profile")
  check(pi_profile.css(".home-pi-links a").map { |a| a["href"] } == ["#{prefix}/cv/", YAML.safe_load_file("_config.yml", aliases: true).fetch("author").fetch("googlescholar"), "mailto:yangyi.wu@whu.edu.cn"], "Incomplete homepage PI links")
  section_order = page.css(".home-content > section, .home-content > .home-bottom-grid").map { |section| section["class"].split.last }
  check(section_order == %w[home-introduction home-profile home-research home-selected home-section], "Homepage must separate the group introduction and PI profile before research")
  check(page.css(".home-introduction > .home-section-label, .home-introduction > .home-introduction-copy").length == 2, "Introduction title and copy must be separate columns")
  check(page.at_css(".home-profile #home-pi") && page.css(".home-introduction #home-pi").empty?, "PI profile must have its own section")
  check(page.css(".home-values").length == 1 && page.at_css(".home-contact .home-values a")["href"] == "#{prefix}/join/#join-values-title", "Research values must sit with students and collaboration")
  check(page.at_css("#home-research-title").text == (language == "zh" ? "研究主线" : "Research framework"), "Wrong framework heading")
  check(page.at_css("#home-highlights-title").text == (language == "zh" ? "研究亮点" : "Research highlights"), "Wrong highlights heading")
  admissions = YAML.safe_load_file("_data/group.yml").fetch("admissions").find { |cohort| cohort.fetch("year") == "2027" }
  check(page.at_css(".home-admissions").text.include?(admissions.fetch(language)), "Homepage admissions differ from the shared data")
  check(page.at_css(".home-phd-note").text.include?("2028"), "Missing expected PhD recruitment year")
  %w[introduction methods pi invitation conversation].each do |key|
    check(page.css(".home-content p").any? { |p| p.text == homepage.fetch(language).fetch(key) }, "Missing homepage #{key}: #{language}")
  end
  research_page = html(root, "#{prefix}/research/")
  group = YAML.safe_load_file("_data/group.yml")
  check(research_page.css(".research-sections a").length == 5, "Missing research section navigation")
  check(research_page.css(".research-sections a").all? { |a| research_page.at_css(a["href"]) }, "Broken research section anchor")
  check(research_page.css("#research-methods p").map(&:text) == [homepage.fetch(language).fetch("methods"), homepage.fetch(language).fetch("data_analysis"), group.fetch(language).fetch("methods")], "Methods and data must be preserved in Research")
  check(research_page.css("p").any? { |p| p.text == homepage.fetch(language).fetch("research_intro") }, "Research framework must be preserved in Research")
  project_links = research_page.css(".research-project-list h3 a")
  check(project_links.map(&:text) == group.fetch("projects").map { |project| project.fetch("title_#{language}") }, "Missing research project titles")
  check(project_links.map { |a| a["href"] } == group.fetch("projects").map { |project| "#{prefix}/projects/##{project.fetch('id')}" }, "Incorrect project entry points")
  check(project_links.all? { |a| projects.at_css("##{a['href'].split('#').last}") }, "Broken project detail anchor")
  check(projects.at_css(".section-back a")["href"] == "#{prefix}/research/#research-projects", "Missing return from project details")
  check(page.at_css("#home-news-title + a")["href"] == "#{prefix}/news/", "Missing homepage news archive link")
  about_page = html(root, "#{prefix}/about/")
  check(!about_page.at_css(".group-page-body").text.include?(group.fetch(language).fetch("methods")), "Duplicated methods in About")
  check(about_page.css(".section-links a").map { |a| a["href"] } == %w[research people join].map { |slug| "#{prefix}/#{slug}/" }, "Missing group introduction entry points")
  cv_page = html(root, "#{prefix}/cv/")
  check(cv_page.at_css("#main").text.include?(admissions.fetch(language)), "CV admissions must use the shared current information")
  check(cv_page.at_css(".group-page--inner") && cv_page.css(".sidebar").empty?, "CV must share the site page layout")
  research.each_with_index do |theme, index|
    section = page.at_css("[data-research-theme='#{theme.fetch('id')}']")
    check(section && section.at_css("h3 a").text == theme.fetch("title_#{language}"), "Inconsistent homepage research theme: #{language}")
    check(section.at_css("h3 a")["href"] == "#{prefix}/research/##{theme.fetch('id')}", "Wrong research theme link: #{language}")
    check(section.at_css(".home-theme-step").text == format("%02d", index + 1), "Incorrect research framework sequence")
    check(section.at_css(".home-theme-question").text == theme.fetch("home_question_#{language}"), "Missing homepage research question: #{language}")
    check(section.at_css(".home-theme-overview").text == theme.fetch("overview_#{language}"), "Missing homepage research context: #{language}")
    check(section.css(".home-theme-context, .home-theme-focus").empty?, "Homepage research should be concise")
    check(theme.fetch("focus_zh").length == theme.fetch("focus_en").length, "Unpaired research topics")
    check(section.at_css(".text-link")["href"] == "#{prefix}/research/##{theme.fetch('id')}", "Wrong research detail link")
    detail = research_page.at_css("##{theme.fetch('id')}")
    check(detail && detail.at_css("h2").text == theme.fetch("title_#{language}"), "Missing research theme anchor: #{language}")
    check(detail.at_css(".research-question").text == theme.fetch("question_#{language}"), "Missing research question: #{language}")
    check(detail.css(".research-focus li").map(&:text) == theme.fetch("focus_#{language}"), "Detailed topics must remain in Research")
    check(detail.css("p").last.text == theme.fetch("text_#{language}"), "Missing research discussion: #{language}")
    links = detail.css(".research-papers a").map { |a| a["href"] }
    check(links == theme.fetch("papers").map { |path| "#{prefix}#{path}" }, "Incorrect theme publications: #{language}")
    theme.fetch("papers").each { |path| check(publications.key?(path), "Unknown research publication: #{path}") }
    check(cv_page.css("#main a").any? { |a| a.text == theme.fetch("title_#{language}") && a["href"] == "#{prefix}/research/##{theme.fetch('id')}" }, "Inconsistent CV research theme: #{language}")
  end
  check(page.css(".home-highlight").length == homepage.fetch("highlights").length, "Missing homepage highlights: #{language}")
  homepage.fetch("highlights").each do |highlight|
    record = publications.fetch(highlight.fetch("paper"))
    year = record.fetch("date").year
    check((first_year..current_year).cover?(year), "Homepage paper outside #{first_year}-#{current_year}: #{highlight.fetch('paper')}")
    role = record["wu_author_role"]
    check(role_labels.key?(role), "Homepage requires first or corresponding authorship: #{highlight.fetch('paper')}")
    check(!record.fetch("authorship_source", "").empty?, "Unverified homepage authorship: #{highlight.fetch('paper')}")
    entry = page.at_css(".home-highlight[data-publication='#{highlight.fetch('paper')}']")
    check(entry && entry.at_css("h3 a").text == highlight.fetch("title_#{language}"), "Untranslated homepage highlight: #{language}")
    check(entry.at_css("h3 a")["href"] == "#{prefix}#{highlight.fetch('paper')}", "Wrong homepage publication link: #{language}")
    check(entry.at_css("p:not(.home-highlight-source)").text == highlight.fetch("summary_#{language}"), "Missing homepage contribution: #{language}")
    figure = entry.at_css(".home-original-figure")
    check(figure.at_css("figcaption span").text == highlight.fetch("figure_caption_#{language}"), "Missing original-figure provenance: #{language}")
    check(figure.at_css("a")["href"] == "#{prefix}#{highlight.fetch('paper')}", "Original figure must link to localized research")
    image = figure.at_css("img")
    expected_image = "/images/research-originals/#{highlight.fetch('figure')}-1280.webp"
    check(image["src"] == expected_image && image["srcset"] && image["width"] == "1280" && image["height"] == highlight.fetch("figure_height").to_s, "Invalid original-figure asset or dimensions")
    check(image["alt"] == highlight.fetch("figure_caption_#{language}"), "Untranslated original-figure alternative text")
    check(root.join(expected_image.delete_prefix("/")).size < 200_000, "Homepage figure exceeds image budget")
    venue = entry.at_css(".home-highlight-source i").text
    check(selection.fetch("allowed_venues").include?(venue), "Unapproved homepage journal: #{venue}")
    check(entry.at_css(".home-highlight-source").text.strip == "#{venue} · #{year} · #{role_labels.fetch(role).fetch(language)}", "Incorrect homepage authorship label: #{language}")
    if role == "first"
      paper = html(root, "#{prefix}#{highlight.fetch('paper')}")
      check(paper.at_css(".publication-authors").text.start_with?("Wu, Y.,"), "Incorrect first-author label: #{highlight.fetch('paper')}")
    end
  end
  check(page.css(".publication-entry").empty?, "Homepage repeats the full publication archive: #{language}")
  check(page.css(".home-research-areas section").length == 3, "Missing homepage research areas: #{language}")
end

Dir.glob(root.join("**/*.html")).each do |file|
  page = Nokogiri::HTML(File.read(file, encoding: "UTF-8"))
  forbidden = ["考察", "纳入"]
  check(forbidden.none? { |word| page.css("#main").text.include?(word) }, "Disallowed Chinese wording: #{file}")
  page.css("script:not([src])").each do |script|
    next if script["type"] == "application/ld+json" || !checked_scripts.add?(script.text)
    mode = script["type"] == "module" ? "module" : "commonjs"
    _, error, status = Open3.capture3(node, "--input-type=#{mode}", "--check", stdin_data: script.text)
    check(status.success?, "Broken inline script after HTML compression in #{file}: #{error}")
  end
end
puts "PASS: bilingual publication routes, navigation, reviewed content, links, image budget and production inline scripts."
