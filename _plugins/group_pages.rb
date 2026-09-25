module AcademicSite
  class GroupPages < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      site.data.fetch("group").fetch("pages").each do |slug, titles|
        %w[en zh].each do |language|
          prefix = language == "zh" ? "/zh" : ""
          page = Jekyll::PageWithoutAFile.new(site, site.source, "", "group-#{language}-#{slug}.html")
          page.content = "{% include group-content.html %}"
          page.data = {
            "layout" => "group", "lang" => language,
            "title" => titles.fetch(language), "group_section" => slug,
            "permalink" => "#{prefix}/#{slug}/",
            "alternate_url" => "#{language == 'zh' ? '' : '/zh'}/#{slug}/"
          }
          site.pages << page
          page.data["redirect_from"] = ["/about.html"] if slug == "about" && language == "en"
        end
      end
    end
  end
end
