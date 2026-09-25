require "nokogiri"
require "yaml"
require "date"
require "pathname"
require "open3"
require "set"

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
  cards = page.css(".publication-entry")
  check(cards.length == records.length, "Incomplete publication list: #{path}")
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
  check(page.css(".publication-media").length == records.values.count { |record| record["visual_reviewed"] && record["thumbnail"] }, "Reviewed publication images missing: #{path}")
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
check(entry_page.at_css("html")["data-language-entry"] == "true", "Missing language entry")
check(entry_page.at_css(".group-wordmark") && entry_page.at_css(".site-city-photo"), "Language entry must use the group identity and licensed city photograph")
check(entry_page.css("[data-language-option]").map { |a| a["href"] }.sort == %w[/en/ /zh/], "Chooser must have working no-JS links")
%w[/en/ /zh/ /about/ /zh/about/ /projects/ /zh/projects/ /people/ /zh/people/ /news/ /zh/news/ /join/ /zh/join/ /research/ /zh/research/ /team/ /zh/team/ /cv/ /zh/cv/ /talks/ /zh/talks/].each do |path|
  page = html(root, path)
  check(page.at_css("[data-language-option]"), "Missing language switch: #{path}")
  check(page.css("script[src]").none? { |script| script["src"].match?(/mathjax|plotly|polyfill/) }, "Unneeded diagram engine on a main page: #{path}")
  expected_alternate = path.start_with?("/zh/") ? path.delete_prefix("/zh") : "/zh#{path}"
  expected_alternate = "/en/" if path == "/zh/"
  expected_alternate = "/zh/" if path == "/en/"
  check(page.at_css("[data-language-option]")["href"] == expected_alternate, "Wrong paired route: #{path}")
  tails = page.css("#site-nav .persist.tail")
  check(tails.length == 1 && tails.first.at_css("[data-language-option]"), "Unstable navigation order after resizing: #{path}")
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
  font_preload = page.at_css("link[rel='preload'][as='font']")
  check(font_preload && font_preload["href"].match?(%r{/assets/webfonts/utsi/utsi-sans\.woff2\?v=\d+$}), "Missing font cache version")
  check(root.join("assets/css/main.css").read.include?(font_preload["href"].split("/").last), "Font preload and stylesheet versions differ")
  check(page.at_css(".home-hero .home-identity") && page.css(".urban-cover").empty?, "Homepage must use the institutional identity")
  city_photo = page.at_css(".home-hero .site-city-photo")
  check(city_photo && city_photo["fetchpriority"] == "high" && city_photo["srcset"], "Missing responsive hero photograph")
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
  check(students.map { |student| student.fetch("id") }.sort == %w[d l q t y z], "Incorrect student roster")
  students.each do |student|
    profile = people.at_css("[data-student='#{student.fetch('id')}']")
    check(profile.at_css("h3").text == student.fetch("name_#{language}"), "Incorrect anonymous display name")
    check(profile.at_css(".group-meta").text == student.fetch("cohort_#{language}"), "Incorrect student cohort")
    check(profile.css("li").map(&:text) == student.fetch("details_#{language}"), "Incorrect student details")
    if student["paper"]
      check(publications.key?(student["paper"]), "Unknown student publication")
      check(profile.at_css("a")["href"] == "#{prefix}#{student['paper']}", "Wrong student paper language")
    else
      check(profile.css("a").empty?, "Unverified student publication link")
    end
  end
  check(html(root, "#{prefix}/join/").css(".group-admissions dt").map(&:text) == %w[2027 2028 2026], "Incorrect admissions cohorts")
  check(page.at_css(".profile-lead").text == homepage.fetch(language).fetch("lead"), "Wrong homepage introduction: #{language}")
  check(page.at_css(".home-section-label h2").text == homepage.fetch(language).fetch("perspective_title"), "Wrong research perspective heading: #{language}")
  section_order = page.css(".home-content > section, .home-content > .home-bottom-grid").map { |section| section["class"].split.last }
  check(section_order == %w[home-introduction home-research home-selected home-section], "Homepage must introduce the framework before its research highlights")
  check(page.at_css("#home-research-title").text == (language == "zh" ? "研究主线" : "Research framework"), "Wrong framework heading")
  check(page.at_css("#home-highlights-title").text == (language == "zh" ? "研究亮点" : "Research highlights"), "Wrong highlights heading")
  admissions = YAML.safe_load_file("_data/group.yml").fetch("admissions").find { |cohort| cohort.fetch("year") == "2027" }
  check(page.at_css(".home-admissions").text.include?(admissions.fetch(language)), "Homepage admissions differ from the shared data")
  check(page.at_css(".home-phd-note").text.include?("2028"), "Missing expected PhD recruitment year")
  %w[introduction approach research_intro invitation conversation].each do |key|
    check(page.css(".home-content p").any? { |p| p.text == homepage.fetch(language).fetch(key) }, "Missing homepage #{key}: #{language}")
  end
  research_page = html(root, "#{prefix}/research/")
  cv_page = html(root, "#{prefix}/cv/")
  research.each_with_index do |theme, index|
    section = page.at_css("[data-research-theme='#{theme.fetch('id')}']")
    check(section && section.at_css("h3 a").text == theme.fetch("title_#{language}"), "Inconsistent homepage research theme: #{language}")
    check(section.at_css("h3 a")["href"] == "#{prefix}/research/##{theme.fetch('id')}", "Wrong research theme link: #{language}")
    check(section.at_css(".home-theme-step").text == format("%02d", index + 1), "Incorrect research framework sequence")
    check(section.at_css(".home-theme-question").text == theme.fetch("home_question_#{language}"), "Missing homepage research question: #{language}")
    check(section.at_css(".home-theme-overview").text == theme.fetch("overview_#{language}"), "Missing homepage research context: #{language}")
    check(section.css(".home-theme-focus li").map(&:text) == theme.fetch("focus_#{language}"), "Missing homepage research topics: #{language}")
    check(theme.fetch("focus_zh").length == theme.fetch("focus_en").length, "Unpaired research topics")
    check(section.at_css(".text-link")["href"] == "#{prefix}/research/##{theme.fetch('id')}", "Wrong research detail link")
    detail = research_page.at_css("##{theme.fetch('id')}")
    check(detail && detail.at_css("h2").text == theme.fetch("title_#{language}"), "Missing research theme anchor: #{language}")
    check(detail.at_css(".research-question").text == theme.fetch("question_#{language}"), "Missing research question: #{language}")
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
  forbidden = ["\u8003\u5bdf", "\u7eb3\u5165"]
  check(forbidden.none? { |word| page.css("#main").text.include?(word) }, "Disallowed Chinese wording: #{file}")
  page.css("script:not([src])").each do |script|
    next if script["type"] == "application/ld+json" || !checked_scripts.add?(script.text)
    mode = script["type"] == "module" ? "module" : "commonjs"
    _, error, status = Open3.capture3(node, "--input-type=#{mode}", "--check", stdin_data: script.text)
    check(status.success?, "Broken inline script after HTML compression in #{file}: #{error}")
  end
end
puts "PASS: bilingual publication routes, navigation, reviewed content, links, image budget and production inline scripts."
