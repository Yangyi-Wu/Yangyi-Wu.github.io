# UTSI Website

## Identity

- 城市转型与空间不平等课题组
- Urban Transformation and Spatial Inequality (UTSI) Research Group
- Wuhan University, School of Urban Design
- Principal investigator: Yangyi Wu / 伍杨屹, Associate Professor

The group identity follows the owner-approved conversation, not a claim of formal university center status.

## Bilingual Structure

Keep Jekyll/AcademicPages and existing publication URLs. English lives at `/`, Chinese at `/zh/`. Every main page and publication has a corresponding language route. Language switching preserves the current page.

| Page | English | Chinese | Purpose |
| --- | --- | --- | --- |
| Home | `/` | `/zh/` | Identity, agenda, selected research, news, recruitment |
| About | `/about/` | `/zh/about/` | Research philosophy, methods, planning relevance |
| Research | `/research/` | `/zh/research/` | Three themes with questions and linked papers |
| Projects | `/projects/` | `/zh/projects/` | Verified funding titles, periods and roles |
| People | `/people/` | `/zh/people/` | PI profile; verified student profiles can be added later |
| Publications | `/publications/` | `/zh/publications/` | Complete bibliography, search and theme filter |
| News | `/news/` | `/zh/news/` | Verified publication updates |
| Join Us | `/join/` | `/zh/join/` | Admissions and contact |

Personal CV, talks and legacy team routes remain accessible. `/about.html` redirects to the new About page. Historical research anchors remain valid.

## Research Agenda

Urban Transformation / 城市转型: changes in industrial activity and place advantage.

Spatial Restructuring / 空间重构: the organization of employment, housing and urban connections.

Spatial Inequality / 空间不平等: unequal opportunities, resource use and institutional constraints.

These form a research agenda, not a claim that every article establishes one causal chain. Publications can belong to multiple themes. Methods and interdisciplinary outputs remain discoverable without being forced into an unsuitable theme.

## Sources and Content Rules

Faculty source: https://sud.whu.edu.cn/info/1611/49111.htm

Checked 2026-09-25 against the official faculty page in the browser. Four selected projects are shown with their published roles. English translations of Chinese project titles are descriptive, not certified grant titles. No award numbers, budgets, student membership or project outputs are inferred.

Student and alumni rosters were not verified from public faculty information; omit empty sections. Existing papers and approved illustrations are retained. Highlight selection remains limited to the latest three calendar years, selected journals and verified first/corresponding authorship.

Admissions follow the owner's supplied 2026/2027/2028 plans, subject to official university notices. No funded vacancy is implied.

## Maintenance

- `_data/group.yml`: paired group copy, projects, news and admissions.
- `_data/research.yml`: paired research themes and related publications.
- `_data/homepage.yml`: homepage introduction and curated highlights.
- `_data/publication_themes.yml`: publication-to-theme assignments.
- `_plugins/group_pages.rb`: paired group routes.
- `scripts/verify-site.rb`: built-site content, link, language and image checks.

News dates currently use verified publication years, not fabricated announcement dates. Add people only after identity, role and permission to publish are established.
