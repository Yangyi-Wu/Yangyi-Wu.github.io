module AcademicSite
  class BilingualPublications < Jekyll::Generator
    safe true
    priority :normal

    def generate(site)
      records = site.data.fetch("publication_records", {})
      site.collections.fetch("publications").docs.each do |doc|
        doc.data.merge!(records.fetch(doc.basename_without_ext, {}))
        doc.data["lang"] = "en"
        doc.data["layout"] = "publication"
        doc.data["alternate_url"] = "/zh#{doc.url}"
        doc.data["publication_url"] = doc.url

        translated = Jekyll::PageWithoutAFile.new(site, site.source, "", "translated-#{doc.basename_without_ext}.html")
        translated.content = doc.content
        translated.data = doc.data.merge(
          "lang" => "zh", "permalink" => "/zh#{doc.url}",
          "alternate_url" => doc.url, "author_profile" => true
        )
        site.pages << translated
      end

      %w[/ /publications/ /research/ /team/ /cv/ /talks/].each do |path|
        english = site.pages.find { |page| page.url == path }
        chinese = site.pages.find { |page| page.url == "/zh#{path}" }
        next unless english && chinese
        english.data["alternate_url"] = chinese.url
        chinese.data["alternate_url"] = english.url
      end
    end
  end
end
