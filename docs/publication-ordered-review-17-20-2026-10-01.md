# Ordered publication review: entries 17-20

Date: 2026-10-01.

## Scope and decisions

The doctoral dissertation (entry 05) remains text-only. Entry 17 is an edited volume, not a journal article; it remains text-only and is not counted as a completed article illustration. Homepage selections, text-only archives and member preferences are unchanged.

| Entry | Decision | Source-verified contribution | Final asset |
| --- | --- | --- | --- |
| 18 Green infrastructure | Redo | Joint park/trail responses and unequal alternatives cannot be reduced to one ordinal increase/decrease measure. | images/publications/green-alternatives-joint-response-2023-v2-reviewed.png |
| 19 Drinking water | Redo | Lower across-district inequality can coexist with stronger spatial concentration. Tap water is a subset of improved sources. | images/publications/water-inequality-spatial-concentration-2023-v2-reviewed.png |
| 20 Walking | Redo | Frequency, duration and origin/destination/potential-path context yield different spatially controlled associations. | images/publications/walking-frequency-duration-2023-v2-reviewed.png |

## Evidence and boundaries

- Entry 18: supplied Wu23UFUG_Green infrastructure inequality.pdf, survey design p. 3, joint responses/models pp. 6-7, discussion p. 8. Page 6 was rendered and visually inspected. Nine categories are self-reported visit changes relative to the previous year, not measured infection effects, visitation counts or demand. The first image's unsupported crisis-infrastructure framing and invented curves were removed. The new matrix is conceptual, not a prevalence heatmap; illustrative park/trail linework is not measured geography. Increased unmet demand is discussed as a possibility, not a directly estimated causal mechanism.
- Entry 19: supplied Wu23PG_Regional Drinking Water Supply in Pakistan Regional Disparity Inequality and Development Pattern.pdf, abstract p. 2, source definitions p. 6, methods pp. 6-8, results pp. 11-12, discussion pp. 13-14 (including cover). Page 12 and Table 4 were rendered and inspected. 2015 survey data cover 112 districts. Improved sources include tap, hand pump and motor pump; they are not mutually exclusive with tap water. Comparisons refer to all-population district coverage; provincial and urban-rural variation must not be erased. Icons illustrate dimensions, not indicator magnitudes. Source categories do not demonstrate safely managed water, personal access, continuity or laboratory-tested quality. No national map was synthesized.
- Entry 20: supplied Wei23JTH_Urban form, air pollution, and walking behavior.pdf, methods pp. 4-5, Table 3 p. 7, discussion pp. 8-9. Page 7 and the model tables were rendered and visually checked. The six PM symbols were checked against spatial Table 3: duration origin negative, potential path negative, destination nonsignificant; frequency origin positive, potential path and destination nonsignificant at 5%. These are qualitative associations, not magnitudes, causes or personal health effects. Emissions-based interpolation is not measured personal exposure. The dashed route is a hypothetical potential path, not observed GPS data.
- All three new assets used the built-in image-generation tool, not CLI/API fallback. No backend model identifier is exposed. Only these three responsive image sets were optimized.
- Previous batch 190a1b2 deployed successfully (run 36777783190); six bilingual routes and medium/large byte hashes were checked live. Both live dissertation pages remained text-only.

## Outputs

Selected engine originals:

- Green infrastructure: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-d5305d2a-737f-4580-870b-f5484fa09f3b.png
- Water: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-f9bed10c-4bb1-44b1-a36d-5f8aa73b5c52.png
- Walking: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-b331ed1e-0f0a-4ed6-b5d7-cbd9cceb9bf2.png

## Verification

Jekyll build, all 33 bilingual publication records, exact asset checks for 21 figures and four publication-filter tests passed. All 12 browser combinations (three papers, English/Chinese, 1440/390-pixel viewports) passed responsive image, paired-language link, original-size viewer, zoom, fit and close checks without horizontal overflow or page errors. Six screenshots were visually inspected. Small mobile labels are available in the full-size viewer with bilingual captions. Both publication archives remain text-only; both dissertation pages have neither figure nor viewer. The temporary local preview and browser were closed.

Medium WebPs: 81,112 bytes (green infrastructure), 76,966 (water), 100,408 (walking).

## Prompt set

### 18 Green infrastructure

```text
Use case: scientific-educational.
Asset type: English graphical abstract for an urban geography research article detail page, landscape 1536 x 1024.
Create a sophisticated, highly legible journal-style diagram about Wu et al. (2023), Urban Forestry & Urban Greening, parks and trails in Salt Lake County during COVID-19. This is a conceptual synthesis of survey categories, NOT a statistical chart.
Primary contribution: jointly analyzing park and trail visit changes reveals responses that cannot be collapsed into a single linear increase/decrease scale. Alternatives and personal/neighborhood conditions matter to green-space inequality.
Exact title: "Park use and trail use can diverge"
Subtitle: "Green-space equity involves access and alternatives"
Main composition: a clean 3 by 3 response matrix occupying the central 65% of the canvas. Column group title "TRAIL VISITS", columns left to right "Less", "Same", "More". Row group title "PARK VISITS", rows top to bottom "Less", "Same", "More". Equal cell sizes, subtle gray rules, no color scale. Top-left cell muted brick, label "Both decline"; center neutral, label "Both unchanged"; bottom-right pale jade, label "Both increase". Top-right and bottom-left pale teal, label "Opposing changes" in each. Other four cells remain white with a small simple dot, representing possible response categories. No numbers, no percentage, no count, no arrow within the matrix. Color is categorical illustration, not frequency or probability.
Small precise topographic-plan insets outside the matrix: on left a compact rectangular park with a few clean tree-canopy outlines; on right a short winding recreational trail through contour lines. These are hypothetical tiny illustrations, not maps of Salt Lake County. Use disciplined urban-geography linework, not watercolor or painterly rendering.
Below matrix, one clear full-width line: "Personal resources · Existing access · Neighborhood context".
Small footer, still legible: "Survey-reported changes relative to the previous year"
Second footer: "Conceptual categories, not prevalence or causal effects."
Style: refined research-editorial typography, white background, black text, forest green, teal and a very restrained muted brick accent. Hierarchy strong; title 52px, column/row labels 30px, cell labels 26px minimum. Comfortable 64px outer margins. No logo, no fabricated map, no axes, no fitted curve, no health outcome, no causal arrows, no decorative icons. Every label must be exact and fully inside canvas.
```

### 19 Drinking water

```text
Use case: scientific-educational.
Asset type: English graphical abstract, landscape 1536 x 1024, for Wu and Wei (2023), The Professional Geographer, regional drinking-water coverage in Pakistan.
Primary research contribution to visualize: lower non-spatial inequality does not imply weaker spatial clustering. Improved-water coverage is broader and less unequal across districts, but more spatially concentrated than tap-water coverage. Tap water is INCLUDED in the improved-water category, not a mutually exclusive alternative. In this study improved water includes tap, hand pump and motor pump. Source-category coverage does not establish safely managed quality.
Exact headline, two lines: "Lower inequality does not mean" / "less spatial concentration".
Exact smaller subtitle: "Two views of regional drinking-water coverage".
Left 45%: an elegant nested category diagram. One large thin teal outlined rectangle titled "IMPROVED WATER" containing three minimalist crisp engineering drawings side-by-side: a piped household faucet in its own dark teal outlined small inset titled "Tap water"; a hand pump labeled "Hand pump"; and a motor pump with supply pipe labeled "Motor pump". All three must be unmistakably INSIDE the outer rectangle; faucet inset is a subset. Equal simple drawings, not photorealistic, not watercolor, not 3D houses. Below outer frame short phrase "Definition used in this study".
Right 45%: generous editorial comparison, two stacked lines with restrained marker glyphs:
"Across-district inequality" followed by "Lower for improved water"
"Spatial clustering" followed by "Stronger for improved water"
One small clear line below both: "Compared with tap-water coverage".
Do not invent bar heights, charts, percentages or maps. These text comparisons come from the article's all-population results; not universal conclusions about every province.
Across the lower part an unframed three-column analytical key with short headings: "Inequality" / "Polarization" / "Spatial concentration". Tiny exact labels below: "Gini" / "Esteban–Ray" / "Moran's I". Use three distinct small abstract monochrome scientific glyphs; NOT empirical patterns or measured data.
Bottom: "Coverage is not proof of safe, reliable water."
Footer: "Conceptual synthesis · Pakistan district-level study · Associations, not causal effects".
White background, refined serif headline and clean sans-serif technical labels, dark charcoal, teal, muted burgundy highlight for the logical contrast. Restrained geography-journal graphic design, strong hierarchy and aligned grid. All text large and sharp, minimum 26px; 60px outer margins. No national outlines, no choropleth, no fitted curves, no disease outcomes, no development-to-safety causal arrows.
```

### 20 Walking

```text
Use case: scientific-educational.
Asset type: English journal graphical abstract, landscape 1536 x 1024, for Wei et al. (2023), Journal of Transport & Health, Salt Lake County.
Title exact: "Walking frequency and duration" / "tell different stories".
Subtitle: "Urban form, air pollution and spatial context".
Create an academically precise, visually sophisticated urban-transport geography figure. Main contribution: analyze origins, destinations and POTENTIAL paths separately, and distinguish walking time from trip frequency after controlling spatial effects. Do not claim measured health outcomes or causal pollutant effects.
Top middle third: a clean flat plan-view hypothetical urban street segment spanning canvas, dwelling at left labeled "Origin", simple lined pedestrian route in middle labeled "Potential path", employment/commercial blocks at right labeled "Destination". Precise charcoal linework, understated green trees and rust building accent. No watercolor, no geographic boundary, no map scale or north arrow. Small pedestrians are optional and unobtrusive. Dashed route is illustrative, not observed GPS path.
Lower middle third: one open matrix, three columns aligned with the above positions: "Origin", "Potential path", "Destination". Two rows: "Walking duration" and "Trip frequency". Exact PM spatial-model signs from Table 3:
Duration: Origin NEGATIVE, Potential path NEGATIVE, Destination NOT SIGNIFICANT.
Frequency: Origin POSITIVE, Potential path NOT SIGNIFICANT, Destination NOT SIGNIFICANT.
Represent negative with a burgundy minus in a small circle; positive with a teal plus in a small circle; not significant with a gray hollow circle. IMPORTANT: there must be exactly SIX result symbols in this matrix, aligned correctly. Do not add results for other pollutants or multiply rows.
Matrix heading: "PM associations after spatial controls".
Legend exact: "+ Positive   − Negative   ○ Not statistically significant".
Below the matrix, dominant takeaway text: "Compactness alone cannot explain walking."
Footer line one: "Illustrative street segment · Qualitative model associations, not effect sizes"
Footer line two: "Emission-based pollution estimates, not measured personal exposure or health outcomes".
White background, superbly aligned editorial grid, large expressive serif headline, clean technical labels minimum 28px. Strong hierarchy, comfortable 60px margins. Modern geographic research-journal aesthetic, not a marketing infographic. No fabricated curves, data points, percentages, magnitudes, PM concentration values, health improvement arrow, hierarchy of pollutants or causal diagram.
```
