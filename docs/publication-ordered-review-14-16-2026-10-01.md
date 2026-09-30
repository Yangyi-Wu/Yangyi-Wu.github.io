# Ordered publication review: entries 14-16

Date: 2026-10-01.

## Scope and decisions

Entry 05 (doctoral dissertation) remains text-only. This batch continues from entry 13; homepage selections, text-only archives and member preferences are unchanged.

| Entry | Decision | Verified contribution | Final asset |
| --- | --- | --- | --- |
| 14 City-region inequality | Redo | City-region convergence can coexist with persistent provincial core-periphery divides; geographical scales are not interchangeable. | images/publications/city-region-provincial-scales-2023-v2-reviewed.png |
| 15 Sprawl and amenities | Redo | Compact development trends can retain service shortfalls and sprawl legacies. Amenities diagnose services; they are not a component of the sprawl-index formula. | images/publications/sprawl-amenity-legacy-2023-v2-reviewed.png |
| 16 Tech firm births | Keep existing matrix; add precise bilingual caption | The existing type-by-scale comparison matches the publisher's abstract/highlights and remains readable. No decorative rebuild is necessary. | images/publications/agglomeration-scales-reviewed.png |

## Evidence and boundaries

- Entry 14: supplied Qin22GR_Regional development in YRD.pdf, abstract p. 2 (including cover), multiscale analyses pp. 12-22, discussion pp. 22-24. Page 24 was visually inspected. Online publication is 2022; the website retains the final 2023 issue year. No bibliographic metadata changed.
- The city-region figure uses equal-size hypothetical symbols and matched provincial compartments, not empirical YRD geography, province shapes or index curves. A first draft lacked a core-periphery contrast within each compartment. The refinement added that contrast; a further targeted edit corrected the periphery leader to the teal square in the same compartment as the core. The final was visually checked. Real provinces are not asserted to have identical patterns. Place mobility concerns relative economic status, not population migration.
- Entry 15: supplied Zhang23Land_Sprawl in Urban China.pdf, sprawl metric and explicit noncausal-model statement p. 5, classification/Table 3 p. 8, type descriptions pp. 9-10, discussion/limitations pp. 13-14. Page 8 and Table 3 were visually inspected.
- The sprawl graphic illustrates one of eight types, not every suburb. Amenity change below the city-average per-capita trend is distinguished from direct quality, usage or service-capacity measurement. The urban-planning illustration may use restrained pen/watercolor; it is not an observed neighborhood or freely redrawn map.
- Entry 16: no full paper PDF is present in the supplied source set. Primary publisher abstract/highlights were checked at [ScienceDirect](https://www.sciencedirect.com/science/article/pii/S0264275123001610). The retained matrix summarizes only supported type/scale associations. Detected effect is not treated as a causal effect or magnitude; no detected effect is not a universal zero. No new coefficient or knowledge-flow mechanism was inferred.
- The two newly generated assets used the built-in image-generation tool, not CLI/API fallback. The tool exposes no backend model identifier. Only their responsive asset sets were optimized; the retained matrix's bytes are unchanged.

## Outputs

Selected engine originals:

- City-region: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-29300ec7-95f9-4519-b86a-cc0eebe7b270.png
- Sprawl: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-1ab00fd8-df1b-4bf9-bfc6-869bd87bad32.png

## Verification

Jekyll build, bilingual validation of all 33 records, exact checks for 18 figures and all four publication-filter tests passed. All 12 browser combinations (three papers, English/Chinese, 1440/390-pixel viewports) passed: responsive images, paired-language links, original-size viewer, zoom, fit and close work without horizontal overflow or page errors. The retained matrix was tested at its original 1774-pixel width; new images at 1536 pixels. Six screenshots were visually inspected. Fine mobile labels remain available through the full-size viewer and bilingual captions. Both archives have no entry images; both dissertation pages have no figure or viewer.

Medium WebPs: 70,312 bytes (city-region), 132,076 (sprawl), 44,572 (retained matrix). Previous batch 534701e deployed successfully (run 36775640648) and was checked live, including byte-identical large images and text-only dissertation pages.

## Prompt set

### 14 City-region

```text
Use case: scientific-educational
Asset type: English research graphical abstract 1536 x 1024, regional economic geography.
Primary request: Source-faithful synthesis of Qin, Wei, Wu & Huang, "Regional Development and Inequality within City Regions: A Study of the Yangtze River Delta, China" (Geographical Review, final issue 2023; online 2022). Core contribution: city-region convergence can coexist with persistent provincial core-periphery divides; administrative scales cannot substitute for the cross-border city-region. Data 1990–2018. Do not present integration as a tested causal treatment or mobility as individual migration.

Style: restrained relational economic-geography figure, white, flat geometric charcoal/brick-red/teal, precise sans-serif. No 3D skylines, relief surfaces, badges, locks, scales-of-justice icons, handshakes, cards, gradients, watercolor, curves or measured maps.
Title verbatim: "Regional convergence can coexist with provincial divides"
Subtitle: "The geographical scale changes the interpretation"
Evidence: "Yangtze River Delta · 1990–2018"

Main visual: TWO analytical views of the SAME small hypothetical set of equal-size city squares. Three adjacent thin rectangular provincial compartments labeled "Province A", "Province B", "Province C"; no actual province or national outline, no geographical labels, no real locations or links.
LEFT heading "CITY-REGION VIEW": a broad unfilled rectangular bracket spans all three compartments, visually indicating cross-border analytical extent. Squares include a compact brick-red core cluster near the compartment boundary, a few teal peripheral places and two intermediate gray squares. A concise finding beneath: "Later peripheral growth and upward place mobility".
RIGHT heading "WITHIN-PROVINCE VIEW": repeat exactly the same square positions and colors. Emphasize separately the three provincial frames and label one red square "Provincial core" and one teal square "Periphery" using thin leader lines. Finding: "Core–periphery differences can remain strong".
Shared legend: red "Core", teal "Periphery", gray "Intermediate"; all symbols equal size. Colors denote conceptual roles, not estimated economic values.
Shared evidence boundary directly below: "Hypothetical places and boundaries; not observed YRD geography".

Below, a minimal three-position chronology using short neutral rules, NOT a data plot and NOT a causal chain:
"1990s" / "Core-led growth"
"2000s" / "Emerging peripheral subcenters"
"After 2010" / "Broader convergence, persistent spatial structure"
No upward or downward arrows, fake economic gradients, invented index values or zero-mobility claims.
Large takeaway: "Assess integration across scales, not only through an aggregate gap".
Small qualifier: "Place mobility means changes in relative economic status, not migration".
Citation: "Qin, Wei, Wu & Huang (2023) · Geographical Review".
Footer: "Conceptual synthesis of observational regional development patterns".
Keep every label within 55-pixel margins. Main diagrams compact and explanatory; typography and comparative findings carry the hierarchy.
```

### 14 Matched diagrams and framing

```text
Refine the attached regional-convergence graphical abstract. Keep its title, subtitle, YRD 1990-2018 evidence line, both comparative findings, chronology, place-mobility definition and source scientifically unchanged. Two precise corrections:
1. Rebuild BOTH upper diagrams as the SAME hypothetical nine-city arrangement, using exactly equal-size squares. In EACH of the three provincial rectangles place one brick-red square labelled conceptually as a core, one teal peripheral square and one gray intermediate square, so EVERY province actually contains a core-periphery contrast. Match those three squares' relative positions and colors across the two diagrams. No red mark may straddle a provincial boundary. LEFT: adjacent provincial compartments within one broad cross-border analytical bracket. RIGHT: the same compartments with small gaps and three emphasized individual frames, with leader labels Provincial core and Periphery pointing to the red and teal squares WITHIN THE SAME PROVINCE. City positions are illustrative, not observed geography; do not add links, flows, numerical sizes or a national outline.
2. Remove the rounded tinted banner behind the bottom takeaway and mobility definition. Show both as simple unframed text on white. Remove the thin outer box around the hypothetical-geography qualification; keep its words clearly readable. Flatten heading strips, no gradients.
All other text and source remain unchanged, comfortable 50-pixel margins, 1536 x 1024. Do not claim all provincial patterns are identical in the real YRD; this is a scale-comparison schematic only.
```

### 14 Exact callout correction

```text
Correct ONLY the two callout annotations in the right-hand WITHIN-PROVINCE VIEW. Keep all nine squares, colors, provincial frames, left diagram, typography, chronology and every other word unchanged. Keep "Provincial core" with its existing thin red leader to the red square INSIDE Province B. REMOVE the current Periphery label and ALL its leader segments from Province C, particularly the erroneous segment toward a red square. Reinsert "Periphery" inside Province B near its teal square with ONE short teal leader ending exactly on the teal square. Both callouts must therefore point to the red and teal squares inside Province B, never a gray square or Province C red square. Do not add words, connections, arrowheads, frames, values or shading. All remaining content must be identical. Final 1536 x 1024.
```

### 15 Sprawl legacy and amenity diagnosis

```text
Use case: scientific-educational
Asset type: English graphical abstract, landscape 1536 x 1024, urban planning.
Primary request: Source-faithful figure for Zhang, Wu & Liu (2023), Land, "Characterizing Sprawl Development in Urban China: A Perspective from Urban Amenity". Core contribution: a compact development TREND can coexist with inherited sprawl and amenity shortfalls. Sprawl itself is measured using built-up expansion relative to population change. Amenity growth is a complementary diagnostic, NOT part of the sprawl-index formula. Wuhan, 2015–2021. No causal effect was established.

Visual style: sophisticated architectural/planning research plate. ONE small hypothetical axonometric neighborhood with precise thin pen lines and restrained pale watercolor washes for buildings/vegetation ONLY, appropriate to the planning subject. White background, crisp charcoal sans-serif annotations and muted teal/brick accents. No institutional badges, icons, cards, glossy 3D, bar charts, cartoon figures or actual Wuhan map.
Title verbatim: "Compact growth can retain a sprawl legacy"
Subtitle: "Urban amenities reveal what a land–population trend misses"
Evidence line: "Wuhan · 2015–2021"

Main composition: left 45 percent a concise hypothetical old suburban block, with tightly spaced low-to-mid-rise mixed blocks but very few small teal service locations. Fine thin street network. Do NOT draw specific landmarks, actual households, population counts, real geography or measured amenity locations. Callout "Inherited suburban fabric". Below this illustration exact line: "Illustrative planning sketch, not a mapped neighborhood".
Right 55 percent: three large diagnostic statements aligned vertically, connected only by simple leader lines with no arrowheads to the illustration:
"LAND–POPULATION TREND": "Compact development trend"
"POPULATION": "Continuing growth"
"AMENITIES": "Per-capita amenity growth below the city average".
These summarize the paper's Type 2, not all Wuhan suburbs, and must be clearly headed "One of eight development types". No varying-size symbols or fake numeric bars.

Lower third: a very concise two-part analytical distinction:
"Sprawl measure" / "Built-up expansion relative to population change"
"Service diagnosis" / "Amenity change considered alongside that trend".
Neutral divider only; no equals sign implying amenities are in the sprawl formula.
Large takeaway: "A compact trend does not guarantee adequate urban services".
A modest supporting line: "Renewal, suburbanization and rural change require locally tailored interpretation".
Citation: "Zhang, Wu & Liu (2023) · Land".
Footer: "Conceptual synthesis; classification and spatial regressions do not establish causation".
Avoid exaggerated claim that POI counts measure service quality or residents' actual use, any causal migration arrows, policy impacts, fictitious trends, measured maps or generalized rules for every suburb. Keep labels inside 55-pixel margins, no tiny dense text, clear hierarchy.
```
