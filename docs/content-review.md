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

## Follow-up content work

Review the remaining 29 summaries and illustrations against their source papers
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
