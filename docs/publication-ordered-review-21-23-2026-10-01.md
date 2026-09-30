# Ordered publication review: entries 21-23

Date: 2026-10-01.

## Decisions

All three figures were redone. The dissertation remains text-only. Publication archives and homepage selections are unchanged.

| Entry | Verified contribution | Final asset |
| --- | --- | --- |
| 21 Affordable housing | Housing preferences and policy access do not align; frequently reported barriers need not be the most consequential satisfaction correlates. | images/publications/housing-needs-policy-access-2023-v2-reviewed.png |
| 22 Amenities' double role | Amenities indicate structure and are associated with prices; regime-dependent relationships are not a universal premium. | images/publications/amenity-double-role-regimes-2024-v2-reviewed.png |
| 23 Producer services | Core concentration and suburbanization coexist; agglomeration associations differ across sectors. | images/publications/producer-services-sector-context-2024-v2-reviewed.png |

## Evidence and limits

- 21: supplied Wei23JUPD_Affordable housing in Nanjing.pdf. Read abstract p. 1, methods p. 3, policy context p. 4, preferences/barriers pp. 8-9 and conclusion p. 10. Table 6, p. 9, rendered and visually inspected. 822 validated observations from the 2016 survey with 2018 follow-up. Historical policy case, not current legal guidance. Dwelling plans and architecture are illustrations, not measured or recommended group-specific housing. Connectors show analytical questions, not causal effects or measured attrition. The final image corrects a redundant inequality sentence in the first draft.
- 22: full PDF was not available in the supplied collection. Checked the [primary publisher abstract](https://link.springer.com/article/10.1007/s12061-023-09536-9), including self-organizing maps, spatial regimes and the dual amenity role. Only abstract-supported claims are shown. No specific amenity coefficient, premium ranking, actual regime count, observed geography or price surface is invented. A/B/C and POIs are hypothetical, not model outputs. Final issue year remains 2024.
- 23: full PDF was not available in the supplied collection. Checked the [primary publisher abstract](https://journals.sagepub.com/doi/10.1177/0308518X241245322). The signs are reported association directions, not causal effects, magnitudes or significance levels. The first image incorrectly placed a sector-specific agglomeration paragraph under Institutions; that paragraph was removed in the final edit. The core and three subcentres are hypothetical symbols, not actual numbers/positions or observed migration routes.
- Built-in image-generation tool used for all three, not API/CLI fallback; exact backend identifier unavailable. Existing graphics with unsupported maps, price surfaces and decorative institutional narratives remain inactive.
- Previous batch 184ac8a deployed successfully (run 36779849171).

## Selected originals

- Housing: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-9452caf3-d92e-406b-bdc2-5529b957a6cc.png
- Double role: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-741d26dc-0945-4ea5-9bbf-b8dcecb572fa.png
- Services: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-babf88f0-7f34-465c-926d-41d3116a8f76.png

## Verification

Jekyll build, all 33 bilingual records, exact checks for 24 figures and all four publication-filter tests passed. All 12 browser combinations (three papers, English/Chinese, 1440/390-pixel viewports) passed responsive images, paired-language switching, original-size viewer, zoom, fit and close checks without overflow or page errors. Six screenshots were visually inspected. Both archives remain image-free and both dissertation pages text-only. The temporary preview and browser were closed.

## Prompt set
### 21 Housing

```text
Use case: scientific-educational.
Asset type: refined English graphical abstract, 1536 x 1024, affordable-housing research, Wei et al. (2023), Journal of Urban Planning and Development, Nanjing survey case.
Title exact, two lines: "Housing need and policy access" / "do not align".
Subtitle: "Different preferences, different barriers".
Core contribution: needs of newly employed college graduates, migrant workers and local low-income families do not match program eligibility and housing options; policy knowledge and application procedures are important dissatisfaction factors, not merely number of dwellings. Historical case study, NOT advice about current law.
Composition: three clearly aligned analytical columns, UNFRAMED, no infographic cards.
Left column heading "HETEROGENEOUS NEEDS". Three rows, using no human caricatures:
"College graduates" / "Ownership aspirations"
"Migrant workers" / "Affordable rental needs"
"Local low-income families" / "Tenure and location concerns".
Give each row one tiny clean dwelling-plan glyph, no stereotype, colors muted teal, charcoal and brick. These are group-level tendencies, not universal preferences.
Middle heading "POLICY ACCESS". Draw three slim vertical conceptual threshold lines, labeled above or below, reading "Eligibility", "Information", "Application". A thin neutral connector crosses all three, depicting questions to examine, NOT measured attrition, not a causal flow, not a funnel. No blocked-stick-figure icon and no claim everyone is excluded.
Right heading "HOUSING OPTIONS". Small elegant architectural axonometric drawing of two modest residential blocks and a courtyard, much smaller than main text, charcoal pen outlines and subtle muted green wash appropriate to urban housing planning. Under drawing: "Supply alone is insufficient".
Across bottom, one important unframed two-part statement:
"Most reported barrier" / "is not always the most consequential".
Use two simple identical neutral markers separated by a not-equal sign, NOT chart bars/rank magnitudes.
Footer: "Nanjing survey case · Conceptual synthesis, not measured attrition or causal effects".
White background, beautiful research-editorial typography, large serif title, clean sans-serif labels at least 28px, comfortable 64px margins. Strong hierarchy, thoughtful spacing, restrained burgundy and forest-teal accents. No maps, no national outline, no fake coefficients or percentages, no locks/scales-of-justice, no badges, no bright orange or navy infographic template, no policy-to-equity guaranteed outcome.
```

### 21 Housing correction

```text
Edit this graphical abstract only to correct the bottom takeaway grammar and clarify illustrative dwellings.
Keep the title, three analytical columns, all group labels, three policy questions, residential drawing, palette and composition unchanged.
Replace the entire bottom large sentence and its two colored dots with exactly this clean centered statement: "Most frequently reported ≠ Most consequential"
Do not add other words to that line. Render ≠ once between the two phrases.
Replace the footer with exactly: "Nanjing survey case · Illustrative dwellings · Associations, not causal effects"
The floor plans and housing drawing are illustrative, not measured or prescribed housing layouts for each group. No new maps, causal arrows, numerical results or characters. Maintain the landscape size and all other text.
```

### 22 Double role

```text
Use case: scientific-educational.
Asset type: English geographical graphical abstract, landscape 1536 x 1024, Liu, Wei and Wu (2024), Applied Spatial Analysis and Policy.
Title exact: "Amenities have two analytical roles"
Subtitle: "Urban structure and housing-price associations".
Verified basis: publisher abstract says amenities both indicate urban structure and are associated with housing prices; self-organizing maps and spatial-regime modeling show that significance and direction of hedonic associations vary across urban regimes. Do not invent specific amenity types' coefficient signs or ranks.
Composition: central upper-middle illustration, small clean hypothetical plan of several urban blocks represented by thin gray lines and colored POI dots. It is NOT a map of Nanjing or an output of the self-organizing-map algorithm. Label beneath exactly "Illustrative amenity pattern".
Two neutral thin branching connectors from this same central pattern lead to two large unframed analytical areas below, not causal arrows.
Left heading "STRUCTURE INDICATOR". Below: a minimalist abstract region partition of three irregular but simple adjacent shapes, labeled "Urban regimes". Uniform categorical shades, no geographical names, no north arrow. Underneath "Identifying spatial context".
Right heading "PRICE ASSOCIATION". Below: the same amenity-dot symbol repeated beside three empty conceptual regime frames A, B, C, WITHOUT plus/minus signs, bars, curves or prices. Underneath "Relationships depend on the regime".
Large bottom takeaway, exact: "Not one universal price premium."
Small line: "Direction and significance can vary across urban regimes."
Footer: "Conceptual synthesis · Illustrative spatial patterns · Not a measured map or causal effect".
Style: crisp flat GIS / urban economic geography journal graphic, white background, elegant large serif title, charcoal, muted teal, muted crimson and light gray. No watercolor, no 3D city skyline, no invented price surface, no glowing central core, no monetary icons, no decorative dashboards/cards, no universal positive-premium claim. Labels at least 28px, outer margins 64px. Keep the concept sparse and hierarchically strong.
```

### 23 Producer services

```text
Use case: scientific-educational.
Asset type: sophisticated English economic-geography graphical abstract, 1536 x 1024, Wei, Xiao and Wu (2024), Environment and Planning A: Economy and Space, Shanghai producer services.
Title exact: "Centring and suburbanization can coexist"
Subtitle: "Producer-service geography depends on the sector".
Source-verified claims from publisher abstract: strong city-center concentration persists while dispersion and suburban subcenters emerge. Agglomeration is positively associated with IT/research center emergence but negatively associated with finance/real-estate concentration; the latter needs diversity. Access to public transit is positively associated with IT and research services. Not a causal migration analysis.
Upper-middle left: restrained, FLAT conceptual spatial schematic, a few charcoal block outlines representing "City core" and three small separate teal circles labeled collectively "Emerging subcentres". No national/city outline, no river, no actual city names, no axes, no north arrow, no coast. No arrows moving firms, no invented routes or strong/weak links. Caption directly underneath: "Illustrative locations, not measured Shanghai geography".
Upper-middle right: a sparse editorial two-row comparison, not chart bars:
heading "REPORTED AGGLOMERATION ASSOCIATION"
row 1 "IT and research" followed by teal "+" and small phrase "Centre emergence"
row 2 "Finance and real estate" followed by muted crimson "−" and phrase "Concentration".
Keep both row labels correctly associated with signs. No magnitudes or statistical significance symbols. Below these rows a slim small statement: "Public transit also supports IT and research development" with qualifier "Reported association".
Lower third: three unframed horizontal analytical labels "Urban structure" · "Institutions" · "Sectoral differences", with one short connecting brace, no directional arrow.
Bottom dominant takeaway: "No single location theory explains every sector."
Footer: "Conceptual synthesis of publisher abstract · Associations, not causal effects".
White background, modern geographic research editorial design, dark charcoal, muted teal and restrained crimson. Large refined serif title, clean legible labels minimum 28px, outer margins 64px. Use precise flat geometry and NO watercolor, NO 3D skylines, glowing cores, price surfaces, badges, corporate icons, generic technological illustrations or decorative lock/shield symbols.
```

### 23 Institutional-label correction

```text
Edit the supplied image with a single factual correction: REMOVE all three explanatory paragraphs currently located below "Urban structure", "Institutions" and "Sectoral differences". Retain these three headings as an aligned unframed analytical key joined by the existing brace. The paragraph under Institutions currently repeats an agglomeration result, which must not be presented as an institutional finding.
Do not replace those paragraphs with other factual claims. Tighten the lower spacing after removal so the brace and "No single location theory explains every sector." move up slightly, with the footer below and comfortable outer margins.
Keep every other title, drawing, positive IT/research symbol, negative finance/real-estate symbol, public-transit association line, geography disclaimer, wording, palette and landscape dimensions unchanged. No new map or causal links.
```

