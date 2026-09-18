require "nokogiri"
require "yaml"
require "date"
require "pathname"
require "open3"
require "set"

root = Pathname.new(ARGV.fetch(0, "_site"))
node = ENV.fetch("NODE_EXE", "node")
records = YAML.safe_load_file("_data/publication_records.yml")
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

Dir.glob("_publications/*.md").each do |source|
  data = YAML.safe_load(File.read(source, encoding: "UTF-8").split(/^---\s*$\n?/)[1], permitted_classes: [Date, Time])
  record = records.fetch(File.basename(source, ".md"))
  english_path = data.fetch("permalink")
  ["en", "zh"].each do |language|
    path = language == "zh" ? "/zh#{english_path}" : english_path
    page = html(root, path)
    check(page.at_css("html")["lang"] == language, "Wrong language: #{path}")
    check(page.at_css(".publication-authors").text == record.fetch("authors"), "Missing authors: #{path}")
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
  cards.each do |entry|
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

%w[/ /zh/ /research/ /zh/research/ /team/ /zh/team/ /cv/ /zh/cv/ /talks/ /zh/talks/].each do |path|
  page = html(root, path)
  check(page.at_css("[data-language-option]"), "Missing language switch: #{path}")
  tails = page.css("#site-nav .persist.tail")
  check(tails.length == 1 && tails.first.at_css("[data-language-option]"), "Unstable navigation order after resizing: #{path}")
  page.css("#main a[href], #site-nav a[href]").each do |link|
    href = link["href"].split(/[?#]/).first
    next unless href && href.start_with?("/")
    html(root, href) unless File.extname(href).match?(/\.(png|webp|jpg|pdf)$/)
  end
end

homepage = YAML.safe_load_file("_data/homepage.yml")
["en", "zh"].each do |language|
  prefix = language == "zh" ? "/zh" : ""
  page = html(root, "#{prefix}/")
  check(page.at_css(".profile-lead").text == homepage.fetch(language).fetch("lead"), "Wrong homepage introduction: #{language}")
  check(page.css(".home-highlight").length == homepage.fetch("highlights").length, "Missing homepage highlights: #{language}")
  homepage.fetch("highlights").each do |highlight|
    entry = page.at_css(".home-highlight[data-publication='#{highlight.fetch('paper')}']")
    check(entry && entry.at_css("h3 a").text == highlight.fetch("title_#{language}"), "Untranslated homepage highlight: #{language}")
    check(entry.at_css("h3 a")["href"] == "#{prefix}#{highlight.fetch('paper')}", "Wrong homepage publication link: #{language}")
    check(entry.at_css("p:not(.home-highlight-source)").text == highlight.fetch("summary_#{language}"), "Missing homepage contribution: #{language}")
    venue = entry.at_css(".home-highlight-source i").text
    check(homepage.fetch("selection").fetch("allowed_venues").include?(venue), "Unapproved homepage journal: #{venue}")
    if highlight["first_author"]
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
