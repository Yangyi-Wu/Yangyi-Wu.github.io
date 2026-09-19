---
layout: archive
title: "About & CV"
permalink: /cv/
lang: en
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

Profile
======

Yangyi Wu (伍杨屹), PhD, is an Associate Professor in the School of Urban Design at Wuhan University. His research focuses on the interaction between urban spatial structure and economic activities, with attention to urban equity, innovation, and resilience.

Appointment
======

* Associate Professor, School of Urban Design, Wuhan University
* Location: Wuhan, China

Research interests
======

{% for theme in site.data.research %}
* [{{ theme.title_en }}]({{ '/research/' | relative_url }}#{{ theme.id }}): {{ theme.overview_en }}
{% endfor %}
* Spatial econometrics, network analysis, and multi-source urban big data

Publications
======

<ul>{% for post in site.publications reversed %}
  {% include archive-single-cv.html %}
{% endfor %}</ul>

Talks, sessions, and service
======

<ul>{% for post in site.talks reversed %}
  {% include archive-single-talk-cv.html  %}
{% endfor %}</ul>

Teaching and supervision
======

I supervise research on urban spatial equity, industrial location, and spatial data analysis. Recruitment plans cover Master's students in Planning and professional Master's students in Design for the 2027 cohort, with PhD recruitment expected from 2028. The 2026 cohort covers professional and academic Master's tracks in Planning.

See [Group & Opportunities]({{ '/team/' | relative_url }}) for research collaborations and recruitment details. Programs and places are subject to Wuhan University's annual admissions announcements.

Links
======

* Email: [yangyi.wu@whu.edu.cn](mailto:yangyi.wu@whu.edu.cn)
* Google Scholar: [Profile](https://scholar.google.com/citations?user=Y7KU37UAAAAJ&hl=en)
* GitHub: [Yangyi-Wu](https://github.com/Yangyi-Wu)
