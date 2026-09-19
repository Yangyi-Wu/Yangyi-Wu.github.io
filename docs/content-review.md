# Publication review status

## Display policy

All 33 bibliographic records remain available in both languages. Authors are
transcribed from citations and verified records. 32 records have DOI links checked
against supplied PDFs or publisher records. Every item, including the dissertation,
links directly to its entry in Yangyi Wu's Google Scholar profile.

## Scholar synchronization, 2026-09-18

Read the complete public profile `Y7KU37UAAAAJ`, showing articles 1-33 with
"Show more" disabled. Matched all 32 existing records and added the missing 2026
Land Use Policy paper on politico-economic transition and urban form in the
Greater Bay Area. Scholar and Crossref agree on the author order, 2026 year,
volume 171, article 108280 and DOI 10.1016/j.landusepol.2026.108280.
The December 2026 date is the assigned issue date, not a verified online date.
The new paper's summary, illustration and corresponding-author role remain
unverified, so it is not yet a homepage highlight.

`_data/scholar.yml` records the checked date, all 33 article IDs and the observed
citation snapshot: 1,193 citations, h-index 16 and i10-index 22. These are not live
counters. Blank article citation cells remain null rather than inferred as zero.
Existing canonical titles are retained instead of copying Scholar's occasional
indexing artifacts (for example, the author suffix on the Nanjing housing paper).
Profile: https://scholar.google.com/citations?user=Y7KU37UAAAAJ&hl=en

Only summaries marked `summary_reviewed` and illustrations marked
`visual_reviewed` in `_data/publication_records.yml` are displayed. Older assets
and draft summaries are preserved for subsequent review, not presented as vetted
research claims. A missing flag means pending review, not missing publication.

The publication archive lists every item once within its publication type, in
reverse date order. It has no separate selected-research group. Reviewed images
remain beneath their own entries, and publication detail pages are unchanged.
Editorial highlights belong only on the homepage and follow its selection policy.

## Reviewed examples

- Housing submarkets: supplied `Wu19ASAP_SLC Housing Submarkets.pdf`, abstract
  and hybrid spatial clustering section. About 240,000 single-family houses,
  43 submarkets. Removed the old unsupported "Millions of parcels" figure.
  Source: https://doi.org/10.1007/s12061-019-09301-x
- Park equity, Wuhan: publisher abstract, methods and conclusions. Incorporates
  quality and heterogeneous demand; 28.25% of communities have unmet demand.
  Source: https://www.mdpi.com/2071-1050/17/5/2255
- Tech firm births: publisher abstract and highlights. Specialization and related
  variety operate at multiple scales; unrelated variety has no detected effect;
  urbanization economies act negatively only at city-wide scale. Removed the
  unsupported ranking in the old poster.
  Source: https://www.sciencedirect.com/science/article/pii/S0264275123001610

The three replacements are generated conceptual illustrations. They contain no
geographic boundaries or invented effect sizes. Captions distinguish them from
empirical maps and statistical plots. WebP variants preserve the source artwork.

## Homepage selection

### Research framing, 2026-09-19

The bilingual homepage now introduces the scholar's urban and economic geography
work through concrete questions and research settings rather than a list of topics.
Metropolitan spatial structure, urban amenities and spatial inequality are
intersecting themes, not a single causal chain claimed to be established by all
papers. Shared `_data/research.yml` content keeps homepage, research page and CV
theme names aligned; existing section anchors are preserved.

Research-page descriptions connect each theme to specific publications. They do
not claim a comprehensive theory of urban transformation or procedural justice.
The park-equity homepage example is Salt Lake City, not Wuhan; the separate
supply-demand park study is in Wuhan. Recruitment details and reviewed-image
gates are unchanged. Production verification covers bilingual theme text, anchors,
publication links and CV consistency, alongside existing highlight restrictions.
Desktop and 390px mobile homepages were visually checked in both languages.

Homepage highlights must fall within the current calendar year and the two
preceding years (2024-2026 for the September 2026 review), and Yangyi Wu must be
the first author or an explicitly verified corresponding author. Co-corresponding
authorship is labeled precisely. Both the template and deployment checks enforce
the date, authorship and approved-venue requirements; author order is not evidence
of corresponding authorship.

The current selection is Landscape and Urban Planning (2025, first author) and
Applied Geography (2025, co-corresponding author). The supplied publisher PDFs,
page 1, confirm both roles. The 2022 Cities paper remains in the publication
archive but is no longer a homepage highlight. The approved venues in
`_data/homepage.yml` are an editorial selection, not a universal journal ranking.

These additional bilingual summaries were checked against the supplied papers:

- Park use in peri-urban areas: `Wu25LAUP_Park equity.pdf`, abstract and
  urban/peri-urban comparison. Distinguishes objective access and quality from
  perceptions, improvement needs and pandemic-era park use.
  Source: https://doi.org/10.1016/j.landurbplan.2024.105269
- Amenities and creativity: `Wu22Cities_Amenity and creativity.pdf`, abstract,
  theoretical framework and conclusion. Distinguishes attractiveness to firm
  agglomeration from attractiveness to local creativity and identifies multiple
  spatial relationships. Cross-sectional associations are not causal proof.
  Source: https://doi.org/10.1016/j.cities.2021.103421
- Urban amenities and knowledge-intensive industry locations:
  `Teng25JAPG_Amenity and KI.pdf`, abstract, discussion and conclusion. Connects
  metropolitan sectoral advantage with local amenity diversity and placemaking;
  does not treat the proposed mechanisms as causal estimates.
  Source: https://doi.org/10.1016/j.apgeog.2025.103659

The September 19 image audit replaced and enabled the park-use and industry-scale
illustrations and the neighborhood-amenity/housing illustration. The housing
summary was also checked against the supplied Qu2025ASAP PDF, pp. 1-2 and 22.
Its framework separates accessibility (quantity and quality) from activity
(functional mix and spatial arrangement); cross-sectional associations do not
establish causality. A second batch checked the Shanghai housing-market paper
(supplied Wei24JUA PDF, PDF pp. 2 and 18), the polycentricity review (supplied
Wei2025CGS PDF, pp. 1-2 and 9), and the already-checked Cities creativity paper.
Their images were replaced; the first two received source-checked bilingual
summaries. Nine summaries and nine illustrations are now source-checked.
See `docs/publication-image-audit.md` for rejected-image reasons and output checks.
An intermediate pass applied pen-and-watercolor styling too broadly. The user
clarified that hand drawing is for actual design/planning proposal graphics,
not all research involving parks, buildings or planning. The discipline-specific
correction uses analytical spatial patterns, models and institutional relations.
Original and intermediate versions are preserved. All six corrected images are
integrated, still totaling nine approved illustrations and nine summaries. See
`docs/publication-discipline-prompts-2026-09.md` for the continuing visual policy.
A subsequent comparison retained three of those figures but refined park equity,
industry location and creativity to restore the research contribution and remove
uninformative spatial decoration. See
`docs/publication-figure-refinement-2026-09.md`; the approved count is unchanged.

## Follow-up content work

Review the remaining 24 summaries and 24 illustrations against their source papers
before enabling them. Separate observed associations, proposed frameworks and
established causal evidence. Do not infer student status or individual author
contributions from author order. Add student profiles only with confirmed public
biographies and permission to publish their information.

## Verification

Build with `JEKYLL_ENV=production`, then run:

```sh
node --test tests/language.test.cjs
bundle exec ruby scripts/verify-site.rb _site
```

The deployment workflow runs these checks before uploading the site. Preview an
equivalent local-URL build with `python scripts/preview_site.py --directory _site-preview`.
