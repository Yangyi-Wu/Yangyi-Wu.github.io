---
layout: archive
title: "发表成果"
permalink: /zh/publications/
lang: zh
author_profile: true
---

本页根据公开 [Google Scholar](https://scholar.google.com/citations?user=Y7KU37UAAAAJ&hl=en) 列表整理，目前收录 32 项成果。

{% include base_path %}

{% assign zh_categories = "journal-articles|期刊论文;books-and-chapters|图书、词条与编辑成果;dissertations|学位论文" | split: ";" %}
{% for category_pair in zh_categories %}
{% assign category_parts = category_pair | split: "|" %}
{% assign category_key = category_parts[0] %}
{% assign category_title = category_parts[1] %}
{% assign title_shown = false %}
{% for post in site.publications reversed %}
{% if post.category != category_key %}
{% continue %}
{% endif %}
{% unless title_shown %}
<h2>{{ category_title }}</h2><hr />
{% assign title_shown = true %}
{% endunless %}
{% include archive-single.html %}
{% endfor %}
{% endfor %}
