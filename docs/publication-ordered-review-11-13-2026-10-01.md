# Ordered publication review: entries 11-13

Date: 2026-10-01.

## Scope

Continues source-order review after entries 01-10; entry 05 is the doctoral dissertation and remains text-only by explicit request. This batch covers light-rail resilience (2022), urban form and COVID-19 (2023), and the watershed remote-sensing editorial (2023). Previously disabled, unreviewed summaries are replaced with PDF-checked bilingual text. Homepage selections, member preferences and the text-only publication archives are unchanged.

## Decisions and source evidence

| Entry | Decision | Original problem | Source evidence | Final asset |
| --- | --- | --- | --- | --- |
| 11 Transit resilience | Redo | Generic context chain, invented baseline/decline/recovery curves, badges and decorative transit scenery concealed distinct measures. | Xiao22TRD_transport.pdf, monthly data p. 4, relative-impact and resilience definitions p. 5, Table 3 p. 12, discussion pp. 11-14. Table 3 and original regression tree were visually inspected. | images/publications/transit-loss-recovery-2022-v2-reviewed.png |
| 12 Urban form and COVID-19 | Redo | Fake community trajectories and deterministic compactness-as-mechanism claims; population density and compact land use insufficiently distinguished. | Wu23GR PDF including cover, abstract p. 2, methods pp. 6-7, Table 3 p. 12, stage results pp. 13-14, discussion/limitations pp. 15-16. Original Table 3 was visually inspected. | images/publications/urban-form-stage-context-2023-v2-reviewed.png |
| 13 Watershed remote sensing | Redo | Decorative satellite/landscape/governance imagery implied demonstrated impacts and omitted data-sharing priority. | Wang23RS_RSW.pdf, editorial identification p. 1, nature-human concept/synthesis of 14 articles p. 2, five priorities pp. 2-3, data-availability statement p. 4. Original priorities p. 3 were visually inspected. | images/publications/watershed-integrated-agenda-2023-v2-reviewed.png |

## Scientific boundaries

- Transit relative impact is (observed minus modelled baseline) divided by baseline. Recovery is later relative impact minus earlier impact, not proof of full return to pre-pandemic use.
- Regression-tree importance identifies leading predictors, not causal effects. Neighborhood minority share is not treated as an innate ethnic cause. Building coverage has the highest recovery-model importance; no untested universal density or open-space intervention claim was added.
- The transit abstract and discussion use inconsistent compactness/building-coverage wording. The figure avoids that blanket causal rule and relies on the clearly defined measures and Table 3 instead.
- Urban-form associations vary across stages. Highly impervious urban land use is distinguished from population density; combined dimensions can offset single-dimension associations.
- The pandemic graphic's blocks are hypothetical. Community intervals denote only source-described stages of burden, not measured trajectories, case rates, durations or effect magnitudes. Minority communities are not portrayed as unaffected during recovery. Underlying mechanisms remain unresolved, as explicitly stated in the paper.
- The watershed article is an editorial/research agenda, not an empirical validation. All five priorities are represented, including open data and sharing.
- The catchment, streams, land-cover patches and grids are illustrative. No actual geographical map was freely redrawn, no national outline was generated, and no sensor observations, governance gains or fitted curves were invented.
- Watershed rendering was refined from soft painted patches into flat GIS/atlas-like linework. Watercolor is not used as the general geography style.
- All images use the built-in image-generation tool. The tool does not expose a backend model identifier; no API/CLI fallback was used.

## Outputs

Project-bound PNGs are listed above; each has small, medium and large WebP siblings. Only these three asset sets were optimized.

Selected engine originals:

- Transit: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-b549ca49-b6dc-4d42-bc11-132de83c09ac.png
- Urban form: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-29c282fe-135f-4e51-a884-e4efe7274fd0.png
- Watershed: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-dcad4080-6b14-4dbd-a696-41cf1d614e1c.png

## Verification

Jekyll build, bilingual checks for all 33 records, exact checks for 15 refined graphics and all four publication-filter tests passed. The three medium WebPs are 74,346, 89,424 and 95,864 bytes respectively.

All 12 browser combinations (three papers, English/Chinese, 1440/390-pixel viewports) passed: images load, paired-language navigation works, the 1536-pixel viewer opens, zoom/fit/close work, and there is no horizontal overflow or browser error. Six screenshots were visually inspected. Small mobile labels are read through the full-size viewer or bilingual caption, not claimed readable at embedded scale. Both archives have 33 text-only records; both dissertation detail pages have no figure or viewer.

Previous batch f731d52 deployed successfully (run 36773451304), with all paired pages checked live, byte-identical large WebPs and both dissertation pages confirmed text-only.

## Prompt set

### 11 Transit

```text
Use case: scientific-educational
Asset type: English graphical abstract, landscape 1536 x 1024.
Primary request: Source-faithful research figure for Xiao, Wei & Wu (2022), Transportation Research Part D, "Neighborhood, Built Environment and Resilience in Transportation during the COVID-19 Pandemic". Central contribution: station ridership losses and subsequent recovery are separate measures with different leading neighborhood correlates. Observational Salt Lake County TRAX monthly ridership 2017-2021. Do not invent ridership trajectories or causal determinants.

Style: crisp analytical transport geography, white background, charcoal sans-serif, muted teal and brick red. Unframed editorial composition, no cream paper, shading gradients, cards, decorative badges, people, pathogens, smiley faces, 3D trains or watercolor. Main visual is a clear measurement-and-comparison structure rather than generic transit scenery.
Title (verbatim): "Ridership loss and recovery have different correlates"
Subtitle: "A station-level perspective on transit resilience"
Evidence line: "Salt Lake County TRAX · Monthly ridership, 2017–2021"

Top central measurement diagram:
Two simple equal-width input boxes with thin square-corner outlines: "Observed ridership" and "Modelled no-pandemic baseline". Neutral lines lead into a clearly typeset expression "(Observed − Baseline) / Baseline", labelled "Relative impact". These connections denote calculation only, not causation.
Below this, two aligned columns with no outer frames:
LEFT heading "RIDERSHIP LOSS"; a small horizontal two-part temporal band labelled "Short term" and "Later period", with no data values, plotted points or curves. Definition: "Average relative impact in each period".
RIGHT heading "RECOVERY"; a matching small two-part temporal band, labelled "Short term" and "Later period". Definition: "Later relative impact minus short-term relative impact".
Shared qualification directly beneath: "Different questions, not interchangeable measures".
Within the left column, finding: "Neighborhood minority share leads the loss models".
Within the right column, finding: "Building coverage leads the recovery model".
Use a small restrained annotation "Regression-tree importance, not causal effects". Avoid racial caricatures and any suggestion of innate biological differences.
A short bottom finding in a readable separate line: "The sharp early drop coincides with stay-at-home guidance; later case peaks do not repeat it".
Large takeaway: "Transit planning must address both exposure and recovery capacity".
Citation: "Xiao, Wei & Wu (2022) · Transportation Research Part D".
Footer: "Conceptual synthesis of model definitions and observational findings".
No actual geographic map, no numerical importance bars, no coefficients, no smooth recovery lines, no guaranteed full recovery, no claim a built-environment intervention was tested. All text spelled correctly, comfortably readable, 50-pixel safe margins. The original abstract and discussion differ in wording on compactness, so do not state a universal density or building-coverage causal rule.
```

### 11 Margin and density refinement

```text
Refine only the presentation of the attached transit graphical abstract. Keep the formula, its calculation connectors, the two metric definitions, leading model correlates, source and observational/noncausal boundaries unchanged. Keep landscape 1536 x 1024.
Fix safe margins: both source and footer must fit fully inside at least 55-pixel left/right margins. All text must be away from every edge. Remove the long sentence beginning "The sharp early drop..." from the bottom; it will be explained in the web text instead. This deletion must free space for a comfortably spaced final takeaway and source/footer. Shorten only the displayed large takeaway to "Plan for both ridership loss and recovery capacity". Keep both headings and findings in their existing side-by-side structure. Make the two temporal bands flat solid colors, no gradients or translucent texture. White plain background. Do not add charts, badges, icons, curves, new data or findings. Preserve exact title and subtitle, but make title smaller or two lines if needed to maintain 55-pixel margins.
```

### 12 Urban form and pandemic stages

```text
Use case: scientific-educational
Asset type: English graphical abstract, landscape 1536 x 1024, public-health and urban geography.
Primary request: Redo the figure for Wu, Wei & Liu (2023), Geographical Review, "Urban Form and Spatiotemporal Vulnerability of Local Communities to COVID-19". Contribution: urban-form associations and the relative burden of community groups vary across pandemic stages. Separate population density from compact/high-impervious urban land use. Observational study, 34 residential ZCTAs in Salt Lake County, March 2020–September 2021. Do not claim proven causal mechanisms or that compactness universally protects people.

Visual style: flat analytic scientific figure, clean white, precise charcoal sans-serif, muted teal / brick red / violet as restrained stage accents. No icon badges, viruses, shields, gears, people, decorative cards, watercolor, gradients or 3D. Main visual is a rigorous qualitative stage comparison with readable words rather than fake curves or mapped rates.
Title verbatim: "Urban-form associations change across pandemic stages"
Subtitle: "Population density is not the same as compact urban land use"
Evidence: "Salt Lake County · March 2020–September 2021"

Three equal unframed columns, separated by fine neutral vertical rules:
"INITIAL" column: one small conceptual street block diagram (hypothetical grid, no real map or individual people) with two short street links emphasized. Main finding beneath: "Street connectivity and walkability accompany higher case rates".
"OUTBREAK" column: same small conceptual street-block extent, with two simple land-use categories mixed, indicated by teal and neutral flat cells and a small legend "Jobs / Housing". Main finding: "Land-use mix becomes a prominent correlate".
"RECOVERY" column: same simple block extent with some shaded impervious cells, no morphology-improvement arrow. Main finding: "High-impervious urban land use remains adverse; most other form measures do not".
Shared line directly underneath these small illustrative blocks: "Illustrative form dimensions, not observed maps or estimated effects".
Keep the blocks small: the comparison/findings must dominate, not a large empty map.

Below, a concise horizontal qualitative timing diagram with three named stages, aligned to the three columns above. Three simple straight intervals with open ends, not numerical curves, denote the stages identified as especially affected:
Row label "Minority communities": muted-red interval spans INITIAL and OUTBREAK only; text "Especially affected early".
Row label "New / remote suburban communities": muted-red interval spans OUTBREAK and RECOVERY; text "Especially affected later".
Row label "Traditional urban / suburban communities": fine teal interval spans all three stages; text "Least affected group overall".
Label for this section: "Community burden also changes over time".
Qualification: "Qualitative timing; intervals do not encode case rates".
These are summary intervals of source-described stages, not measured values or a blanket claim that the minority group is unaffected during recovery.

Large bottom takeaway: "Evaluate urban form as a multidimensional, stage-sensitive package".
Smaller qualifier: "Combined dimensions can offset adverse associations; underlying mechanisms remain unresolved".
Citation: "Wu, Wei & Liu (2023) · Geographical Review".
Footer: "Conceptual synthesis of observational findings".
No fitted curves, sample-case points, coefficients, risk magnitudes, causal arrows, generic density-is-bad or density-is-good claim, national outline or real geography. Keep all wording inside 55-pixel safe margins, footer clearly visible. Every paragraph at most three short lines; main findings readable, no crowding.
```

### 13 Watershed agenda

```text
Use case: scientific-educational
Asset type: English landscape graphical abstract 1536 x 1024, watershed geography and Earth observation.
Primary request: Source-faithful figure for Wang, Wu, Hu & Zhang (2023), Remote Sensing, "Remote Sensing of Watershed: Towards a New Research Paradigm". This is an EDITORIAL, not a new empirical experiment. Its contribution is a research agenda integrating nature-human watershed systems, multiple sources/scales, the total environment, open data and decision needs. Do not present ambitions as demonstrated outcomes.

Style: modern geographic atlas / Earth-observation schematic, clean white, fine contour-like linework, flat desaturated green land patches, blue dendritic streams, sparse dark-gray settlement footprints. No watercolor, ornate paper, photorealistic satellite, 3D landscape, gold seals, institutional clipart, icons, badges, cards, shading gradients or meeting scene.
Main title verbatim: "Watershed remote sensing beyond single-layer monitoring"
Subtitle: "A research agenda for integrated, decision-oriented analysis"
Small evidence line: "Editorial · Wang, Wu, Hu & Zhang (2023)"

Composition: a CENTRAL concise hypothetical watershed cutaway in plan view, not a real geography. A dendritic stream network joins downstream, surrounded by a very light dashed catchment boundary, subdued forest / agricultural / settlement patches. Use fine connective annotation lines without arrowheads to THREE labels: "Water", "Ecosystems", "Human activities". Very clear caption beneath: "Illustrative nature–human watershed; not a mapped study area". No measured hazard map, scale bar, north arrow, national outline, actual named river or decorative coastlines. No invented sensor pixels or data plots.

To its LEFT, two simple overlapping square grids of different spacing, thin flat outlines, labelled "MULTISOURCE DATA" above and "MULTISCALE ANALYSIS" below. Short explanatory labels "Remote sensing + field + socioeconomic data" and "Local processes in regional context". These grids symbolize different supports, not measured imagery. Neutral thin connectors to the central catchment convey research integration only.

To its RIGHT, two clear text-first priorities:
"TOTAL ENVIRONMENT": "Physical, biological and socioeconomic interactions"
"DECISION NEEDS": "Water resources · Agriculture · Planning · Conservation".
Use short leader lines to the central watershed, no guaranteed causal-success arrow, no buildings or government icon.

Across the lower section, one unframed horizontal connecting line with the fifth priority in large type "OPEN DATA AND SHARING", supporting the entire framework. Supporting line "Interoperable data, derived products and analytical tools".
Bottom takeaway: "Link what is observed, how scales interact and what decisions require".
Small footer qualification: "Proposed priorities, not a validated governance-impact model".
Citation: "Wang, Wu, Hu & Zhang (2023) · Remote Sensing".
Make the central illustration moderately sized: enough geographic detail to feel like watershed systems, but the integrated research agenda must dominate. Crisp sans-serif, no long paragraphs, no bullet lists of claimed empirical benefits. All labels exact, at least 50-pixel safe margins.
```

### 13 Cartographic style refinement

```text
Edit ONLY the cartographic rendering style of the central hypothetical watershed and the two grid motifs. Keep EVERY label, all five research priorities, the editorial identification, evidence boundaries, composition, size and source unchanged. The watershed currently has soft painted/tree-canopy washes; replace them with crisp flat GIS/atlas-style land-cover patches and precise thin contour lines. Forest patches uniform muted green, agricultural cells pale solid green with thin boundaries, settlements small charcoal footprint rectangles, water channels clean flat blue lines. No watercolor bleeding, brush strokes, grain, artistic foliage, perspective or relief shading. Two grid motifs should also have uniform flat pale fills and straight crisp grid lines, no shaded texture. It remains an explicitly hypothetical nature-human watershed, not original or empirical geographic evidence. Do NOT change the catchment into a recognizable named area, add map scales, alter any text or add a measured data legend. Preserve the already exact title, five priorities, all integration leader lines without arrowheads and the source/footer. White clean page, all margins unclipped.
```
