---
layout: archive
title: "关于与简历"
permalink: /zh/cv/
lang: zh
author_profile: true
---

个人简介
======

伍杨屹（Yangyi Wu），武汉大学城市设计学院副教授，研究城市空间结构与经济活动之间的相互关系，关注城市公平、创新与韧性等议题。

工作经历
======

* 副教授，武汉大学城市设计学院
* 地点：中国武汉

研究方向
======

{% for theme in site.data.research %}
* [{{ theme.title_zh }}]({{ '/zh/research/' | relative_url }}#{{ theme.id }})：{{ theme.overview_zh }}
{% endfor %}
* 研究方法：空间计量、网络分析与多源城市大数据

发表成果
======

<ul>{% for post in site.publications reversed %}
  {% include archive-single-cv.html %}
{% endfor %}</ul>

学术活动与服务
======

* 2025 年 10 月 17-19 日：在江西师范大学（南昌）共同主持经济地理专业委员会年会分会场“新兴技术对经济地理学的挑战”。
* 2025 年 7 月 25-28 日：在开封共同主持城市地理专业委员会年会分会场“大数据驱动的城市空间转型”。
* 2025 年 4 月 28 日：共同主持地理建模与 GIS 分析专业委员会年会“城市感知与计算”分会场。
* 2024 年 12 月 4 日：受邀在中国地质大学（武汉）清河论坛作“城市空间正义的理论分析与实践探索：以城市绿地为例”学术报告。

教学与指导
======

指导方向包括城市空间公平、产业区位与空间数据分析。2027 级拟招收规划专业硕士研究生和设计专硕，预计自 2028 年起招收博士研究生；2026 级招生专业为规划专业（专硕、学硕）。

研究合作与招生详情见[团队与招生]({{ '/zh/team/' | relative_url }})。具体专业与名额以武汉大学当年度招生通知为准。

链接
======

* 邮箱：[yangyi.wu@whu.edu.cn](mailto:yangyi.wu@whu.edu.cn)
* Google Scholar：[个人主页](https://scholar.google.com/citations?user=Y7KU37UAAAAJ&hl=en)
* GitHub：[Yangyi-Wu](https://github.com/Yangyi-Wu)
