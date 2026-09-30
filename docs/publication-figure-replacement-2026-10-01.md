# Three publication figures: replacement and evidence review

Review and integration date: 2026-10-01. Generation began on 2026-09-30.

## Scope

Only the graphical abstracts on three bilingual publication detail pages are replaced. Reviewed contribution text, findings, authorship and publication dates remain unchanged. The publication archive remains text-only; original-paper figures on the homepage are unchanged.

All three selected raster images were generated with the built-in image-generation tool. The tool did not expose a backend model identifier; no specific model version is asserted. Responsive WebP files are mechanical compressed derivatives of the selected PNGs, not independently redrawn content.

## Selected assets and evidence

| Paper | Selected PNG | Original evidence | Main contribution shown |
| --- | --- | --- | --- |
| Wu et al. (2025), Landscape and Urban Planning | `images/publications/park-equity-experience-v4-reviewed.png` | Publisher PDF, abstract (p. 1), discussion and conclusions (pp. 10-11) | Measured provision can differ from residents' perceptions, needs and use; the southern and western peri-urban comparisons are distinct. |
| Teng, Wu & Liu (2025), Applied Geography | `images/publications/amenity-industry-nested-v2-reviewed.png` | Publisher PDF, Fig. 1, discussion (p. 10) and conclusions (p. 13) | Metropolitan resource access and local amenity configuration operate at nested scales; placemaking helps explain industrial attractiveness. |
| Qu, Wu & Liu (2025), Applied Spatial Analysis and Policy | `images/publications/amenity-housing-framework-v2-reviewed.png` | Publisher PDF, abstract (p. 1), framework discussion and Fig. 1 (pp. 5-6), conclusions (p. 22) | Accessibility includes quantity and quality; activity includes functional mix and spatial arrangement. Private and essential services have different housing-price associations. |

## Evidence boundaries

- The illustrations synthesize concepts and reviewed findings, not all results in the papers.
- Street layouts, buildings, parks, sector outlines and facility locations are hypothetical. They are not maps of Salt Lake City or Wuhan, and their apparent densities are not measured comparisons.
- Industry arrows express the proposed theoretical framework, not identified causal effects. Housing associations are cross-sectional and do not establish causality.
- No invented national map, fitted response curve, SHAP ranking, numerical effect size or optimal facility composition is shown.
- Earlier industry drafts with a realistic invented metropolitan outline were rejected.
- Earlier housing point-count comparisons were rejected because the engine did not hold the other dimensions constant. The accepted graphic presents the original theoretical grouping instead.
- English labels in the images are accompanied by full Chinese and English captions and alternative text on their respective pages.
- Original PNGs are retained. Medium and small WebP versions support normal page reading; the existing accessible viewer opens the large version for detailed inspection.

## Website verification

- The full Jekyll build and bilingual site verification passed, including all 33 publication routes and the text-only archives.
- All four publication-filter unit tests passed.
- Browser checks covered the three detail pages in both languages at 1440px desktop and 390px mobile widths: images loaded, no horizontal page overflow, correct paired-language links, working large-image viewer, zoom, fit and close controls; no page-script errors.
- Desktop figures display at 850px; mobile figures display at 342px. The phone view provides an overview with a complete, readable localized caption. Small internal labels still require the large-image viewer for detailed reading; no claim is made that every label is comfortably readable in the phone overview.
- Medium WebP assets are 97,454 bytes (park), 68,290 bytes (industry), and 72,018 bytes (housing). Original PNGs and full-resolution WebP files are retained.
- Existing original-paper homepage figures and unrelated image assets were preserved.

## Selected generation prompts

The prompts below record the generation and corrective edit sequence leading to the selected files. Initial intermediate files were not published. Reference images supplied to the engine were inspected before editing.

### Park equity

```text
Use case: scientific-educational.
Asset type: publication-detail graphical abstract, a complete single English image for an academic urban geography website.
Input image 1 is an earlier draft to replace. Preserve its verified research meaning, NOT its oversized map or layout. Completely redesign it; omit all real-geography maps.
Study: Wu et al. (2025), Landscape and Urban Planning, Salt Lake City. Core contribution: objective access/quality and residents' perceptions/needs/use must be compared, not treated as interchangeable. Southern peri-urban residents have measured access disadvantage but more optimistic perceived access. Western peri-urban communities have objective access similar to the urban center, different perceptions, greater infrastructure-improvement needs, and pandemic-era use more sensitive to perceived quality. Do not portray all suburbs as deprived; do not invent effect sizes or causal claims.

Create a sophisticated, restrained, journal-quality research graphic with a pure white background, landscape 3:2 composition, exceptionally clear large modern sans-serif typography. Use deep charcoal type, restrained petrol teal for measured conditions, oxide red for reported experience, and quiet park green. No watercolor, cartoon people, giant map, stock icons, shiny 3D, decorative gradients, oversized headline or cards. Crisp cartographic/analytical design with thin precision linework.
Composition: two compact evidence lenses at the top (measured provision versus resident experience). The center contains two clearly labeled horizontal case comparisons, each with a SMALL, elegant top-down park/neighborhood schematic (greenspace, path, simple gray buildings) occupying no more than a quarter of its row; these drawings are conceptual only, not maps. Most space must go to the comparison and the research finding. Southern comparison first, western comparison second. For western comparison place its two short additional findings immediately beneath its resident-experience label as concise typographic annotations. Use simple brackets for comparisons, never causal arrows or fake statistical charts. One strong short conclusion at bottom. Maintain compact hierarchy, no excessive blank margins, no tiny paragraphs. All text must be legible at 850px image width. Only the following verbatim text; no added text:
"Park equity beyond provision"
"MEASURED PROVISION"
"Access · Quality"
"RESIDENT EXPERIENCE"
"Perceptions · Needs · Use"
"SOUTHERN PERI-URBAN"
"Access disadvantage"
"More optimistic perceived access"
"WESTERN PERI-URBAN"
"Access similar to the urban center"
"Different access perceptions"
"Greater infrastructure needs"
"Quality-sensitive use during COVID-19"
"Context matters for park equity"
"Compare resources with residents' experience"
"Wu et al. (2025) · Landscape and Urban Planning"
"Conceptual synthesis; schematics are not measured maps"
No north arrow, coastlines, city boundaries, numerical scales, university logo or personal author portrait. Correct English spelling. This is the author's research contribution, not a generic park poster.
```

### Industrial location: initial generation

```text
Use case: scientific-educational.
Asset type: a single English graphical abstract for an economic/urban geography research paper on an academic website.
Input 1: existing graphic to replace with a substantially more professional and spatially intelligible composition. Input 2: original Fig. 1 of Teng, Wu and Liu (2025), supporting conceptual source. Preserve the original two-scale logic, not its old colors or shapes. Simplify with scholarly accuracy; do not claim causal estimates or literal mapped locations.
Core contribution: metropolitan amenity patterns shape urban spatial structure and potential resource access/competitive advantage; local amenity availability and diversity support placemaking and local attractiveness. The local mechanism is nested in and conditioned by the metropolitan context. Firms jointly consider both. Placemaking is an economic mechanism, not just beautification. Central and outer sectors have different amenity needs; central sectors emphasize innovation ecosystems, outer sectors foundational services and accessibility.

Redesign as an elegant, journal-quality cartographic/technical atlas plate, pure white landscape 3:2. Modern sans-serif labels, moderate title, precise spatial linework, restrained charcoal, deep teal, terracotta and muted gray; subtle green only in land-use schematics. No watercolor, hand sketch, cartoon, marketing style, fake map boundaries, Chinese national map, cute icons, effects charts, invented data or huge headline.
The principal composition should explain NESTED scales through ONE compact hypothetical metropolitan spatial diagram, with a clearly highlighted local district and an enlarged corresponding local street/amenity configuration inset. Metropolitan diagram is analytical spatial structure, not random star-network icons; local inset shows firm plots and different amenity types in a coherent street fabric, using small colored points and blocks and minimal legend. Both are schematic, not real Wuhan geography. Put each spatial view alongside its short conceptual sequence: metropolitan resource access supports competitive advantage; local availability/diversity support placemaking. Thin restrained conceptual connectors link both to one industrial-attractiveness conclusion; the inset relationship visually communicates conditioning/nesting, not independent variables floating in empty space. Diagrams occupy about half the useful space, remaining labels are large enough to read at 850px. A narrow bottom line highlights differentiated central/outer contexts. Avoid paragraphs and repeated labels.
Only these exact texts, no added decorative titles or numerical axes:
"Amenities shape industrial location across scales"
"METROPOLITAN CONTEXT"
"Resource access"
"Competitive advantage"
"LOCAL CONFIGURATION"
"Availability + diversity"
"Placemaking"
"Nested scales"
"Industrial attractiveness"
"Placemaking is an economic mechanism"
"Central sectors: innovation ecosystems"
"Outer sectors: public services and access"
"Teng, Wu & Liu (2025) · Applied Geography"
"Conceptual synthesis of Fig. 1; schematics are not measured maps"
Final must retain the distinction between the two mechanisms, with industrial attractiveness as a JOINT conceptual outcome. No arrows purporting to quantify causality, no formulas, no replacement of 'placemaking' with generic 'quality of life'. All spelling exact; no warped type.
```

### Industrial location: selected corrective edit

```text
Use case: precise-object-edit / scientific-educational correction.
Input: the newly generated industrial-location research graphic. Keep its title, its two-scale mechanism sequences, joint industrial-attractiveness outcome, differentiated central/outer findings and citation wording.
Correct the TOP SPATIAL DIAGRAMS and all unnecessary pictogram icons only. The current large metropolitan landscape looks like an invented empirical Wuhan map and must be removed completely. Replace it with a visibly abstract, compact topology of exactly THREE plain urban-sector outlines: one labeled "Central sector" and two labeled "Outer sector". Simple adjoining irregular polygon blocks, thin gray borders and small teal resource nodes, no natural geography, rivers, roads, boundary shape of a city, contours, north arrow or fake measured patterns. Highlight a small rectangular local area INSIDE one sector and connect it to the local inset with two subtle magnification guide lines. This is an explicit nested spatial concept, not a site map.
The right local inset may retain its clean conceptual street grid with gray firm plots, green park blocks and a small mixture of colored amenity points. Reduce it and the abstract metropolitan topology so the two conceptual mechanism sequences remain the primary visual content. Remove the rail line and ALL complicated legend entries except "Firm" and "Amenity". Remove all hat/education, train, hospital, coffee cup, tree, bus and any other pictogram icons from the mechanism boxes: use only the text "Resource access" and "Availability + diversity". Replace the tiny bottom miniature fake maps with simple colored sector swatches.
Keep "Competitive advantage", "Placemaking", "Nested scales", "Industrial attractiveness", "Placemaking is an economic mechanism", "Central sectors: innovation ecosystems", "Outer sectors: public services and access".
Keep "Teng, Wu & Liu (2025) · Applied Geography".
Footer should now read verbatim "Conceptual synthesis of Fig. 1; spatial diagrams are hypothetical".
The final should be a crisp white-background scholarly atlas DIAGRAM, NOT a watercolor, NOT a map of Wuhan, NOT a generic slide with decorative icon cards. Moderate type size, compact precise layout, distinguish conceptual links from magnification guide lines. Preserve scientific meaning and exact English labels. Only add the three sector labels stated above.
```

### Housing value: replacement framework

```text
Use case: scientific-educational.
Generate a NEW, complete English graphical abstract for Qu, Wu and Liu (2025), Applied Spatial Analysis and Policy. This is scholarly urban spatial analysis, not a marketing poster.
Verified contribution: housing amenity value depends on four distinct characteristics, organized as accessibility (quantity, quality) and activity (functional mix, spatial arrangement). Findings: private services are more quality-sensitive, essential services depend on both quantity and quality. Associations are nonlinear and context-dependent; cross-sectional analysis does not establish causality.
Design: pure-white landscape 3:2, compact contemporary research-institute visual style, precise clean typography, charcoal with muted emerald and cobalt accents. ONE finely drawn, small technical axonometric neighborhood block in the middle: gray residential buildings, streets, one green park and a few colored amenity buildings. This scene is schematic, not real geography, and supports the housing/amenity subject without taking over the figure. No measured maps, point-count comparison, arrays of dots, invented charts, effect coefficients, numbered examples, watermark, giant headline, watercolor, brush strokes, cartoons, floating decorative icons or gradients.
The primary content is a beautifully organized TWO-LEVEL theoretical framework around that compact neighborhood scene. On the left, Accessibility explicitly groups Quantity and Quality. On the right, Activity explicitly groups Functional mix and Spatial arrangement. These are four parallel concepts, not stages or causal steps. A neutral bracket/join from these four dimensions relates them to Housing-value associations. No causal arrowheads. Use clear direct labels, not paragraphs. Beneath, two small analytical findings set side by side: private services are more quality-sensitive; essential services involve quantity and quality. Close with nonlinear/context-dependent associations, not a universal optimization formula. All major words and findings must be readily legible at 850px image width; do not force tiny text. The spatial sketch must occupy at most one quarter of image area.
Only the following verbatim English text:
"Four dimensions of neighborhood amenity value"
"ACCESSIBILITY"
"Quantity"
"Quality"
"ACTIVITY"
"Functional mix"
"Spatial arrangement"
"Housing-value associations"
"Private services"
"Quality matters more"
"Essential services"
"Quantity and quality matter"
"Nonlinear and context-dependent"
"Qu, Wu & Liu (2025) · Applied Spatial Analysis and Policy"
"Conceptual synthesis; not measured geography or causal estimates"
Ensure Quantity/Quality belong ONLY to Accessibility and Functional mix/Spatial arrangement belong ONLY to Activity. Render exact wording, no new claims.
```

### Housing value: selected styling edit

```text
Refine ONLY the visual styling of this research diagram. Keep the central neighborhood axonometric drawing, the grouping and all words exactly as they are; do not change the scientific content.
Remove EVERY pictogram, circular icon, medal, storefront, hospital icon and curve symbol. Remove ALL rounded boxes, colored cards, shaded panels, gradients and filled label bars throughout the image.
Replace the left and right frameworks with open, unframed typography on pure white. ACCESSIBILITY and ACTIVITY are colored text headings; beneath them Quantity / Quality and Functional mix / Spatial arrangement are grouped by ONE thin bracket each. Keep the clear theoretical joining lines, without arrowheads.
'Housing-value associations' becomes simple bold charcoal text on white, not a dark pill.
The two empirical findings at the bottom are simple aligned editorial text columns, with no boxes, dividers, graphics or symbols: 'Private services / Quality matters more' and 'Essential services / Quantity and quality matter'. Preserve that wording and separation.
'Nonlinear and context-dependent' is one calm bold text line beneath them, without a curve or framing. Retain the citation and conceptual-synthesis disclaimer.
Reduce overall black headline weight slightly and retain roomy but compact scholarly margins. Precise technical academic illustration and editorial typography; NOT an infographic-card template or marketing presentation. Do not add any new illustration or words.
```

