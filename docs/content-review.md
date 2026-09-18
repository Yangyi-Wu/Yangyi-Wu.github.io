# Publication review status

## Display policy

All 32 bibliographic records remain available in both languages. Authors are
transcribed from the existing citations. 31 records have DOI links checked against
the supplied PDFs or publisher records; the dissertation has a title-specific
Scholar lookup, not an invented repository URL.

Only summaries marked `summary_reviewed` and illustrations marked
`visual_reviewed` in `_data/publication_records.yml` are displayed. Older assets
and draft summaries are preserved for subsequent review, not presented as vetted
research claims. A missing flag means pending review, not missing publication.

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

The homepage currently selects first-author work in Landscape and Urban Planning
and Cities. This is an editorial selection, not a claim about universal journal
rankings. The approved venues are explicit in `_data/homepage.yml` and checked
before deployment.

Two additional bilingual summaries were checked against the supplied papers:

- Park use in peri-urban areas: `Wu25LAUP_Park equity.pdf`, abstract and
  urban/peri-urban comparison. Distinguishes objective access and quality from
  perceptions, improvement needs and pandemic-era park use.
  Source: https://doi.org/10.1016/j.landurbplan.2024.105269
- Amenities and creativity: `Wu22Cities_Amenity and creativity.pdf`, abstract,
  theoretical framework and conclusion. Distinguishes attractiveness to firm
  agglomeration from attractiveness to local creativity and identifies multiple
  spatial relationships. Cross-sectional associations are not causal proof.
  Source: https://doi.org/10.1016/j.cities.2021.103421

Their older illustrations remain pending review and are not enabled by this
summary update. Five summaries and three illustrations are now source-checked.

## Follow-up content work

Review the remaining 27 summaries and 29 illustrations against their source papers
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
