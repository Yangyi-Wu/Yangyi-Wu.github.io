# Ordered publication review: first three articles

Date: 2026-10-01.

## Order and scope

Proceed from the earliest entry in the publication archive's source order. This batch covers entries 01-03, all from 2019. Their previous poster files were inspected but were not enabled on detail pages because neither their summaries nor their images had source-checked flags. This batch creates new images and enables newly verified bilingual summaries rather than reusing the unreviewed old summaries.

Next entry in this ordered review: 04, "Innovation Network Capabilities and Sustainable Development of Regional Economies" (2019). The previous batch's three 2025 graphics remain unchanged.

## Decisions and evidence

| Entry | Decision | Reason | Source checked | Selected asset |
| --- | --- | --- | --- | --- |
| 01 Private rental housing in Shanghai | Redo | Old draft included unsupported example rents, mobile trajectories, search trends and an overly strong filtering chain. | Supplied Land Use Policy PDF, abstract p. 1, data/multi-level variables pp. 4-5, rental/sale comparison p. 11, conclusions p. 12. Original Fig. 5 and its legend were inspected. | `images/publications/rental-employment-access-2019-v2-reviewed.png` |
| 02 Housing prices, amenities, accessibility and urban structure | Redo | Old generic price mountain could be mistaken for a fitted result, and three factors were connected by an undifferentiated causal arrow. | Supplied Cities PDF, abstract p. 1, concentric-ring comparisons pp. 11-12, Tables 6-7 and conclusions p. 13. Tables were visually inspected. | `images/publications/housing-urban-context-2019-v2-reviewed.png` |
| 03 Amenities, human capital and employment | Redo | Old jobs-people-jobs triangle implied measured mediation or causal direction, and the city models dominated the sectoral comparison. | Supplied Habitat International PDF, abstract p. 1, measures pp. 4-5, results/Tables 5-6 pp. 9-10, discussion/limitations pp. 10-11. Original employment maps in Fig. 5 were inspected. | `images/publications/amenity-employment-sectors-2019-v2-reviewed.png` |

## Scientific boundaries

- These are conceptual syntheses, not replacements for the original data figures. No original map has been freely redrawn or recolored as if it were measured geography.
- Buildings, rings, points and connecting transport lines are hypothetical. Symbol sizes and apparent densities are not observed comment counts, jobs, rent differences, effect sizes or commuting volumes.
- The rental comparison does not place every migrant in a suburb or suggest uniform migrant-population associations across zones.
- The Cities comparison is relative: amenities still matter in suburbs and transport is not irrelevant in the inner city.
- The employment comparison is not an exclusive determinant matrix. Review popularity is not automatically objective quality or satisfaction, and the paper does not establish an observed skilled-worker mediator or causal direction between amenities and jobs.
- A first employment draft classified local population under a transport label. A targeted engine edit corrected this to "Infrastructure and population" and "Road network · Population size".
- Bibliographic dates, authors and identifiers are unchanged. Homepage selection is unchanged. The archive remains text-only.
- The images were created using the built-in image-generation tool, not the API/CLI fallback. The tool exposed no backend model identifier.

## Verification

- Complete Jekyll build and bilingual verification passed for all 33 records, including the six refined figures from this and the previous batch.
- All four publication-filter tests passed. The image optimizer's new single-batch mode rejected an invalid source path without changing the manifest; existing image files were not regenerated.
- The three new detail pages were checked in both languages at 1440px and 390px widths: loaded responsive images, localized summaries and captions, no horizontal page overflow, correct language counterpart, working viewer, zoom, fit and close controls, and no page-script errors.
- Desktop figures use an 850px display width; mobile figures use 342px. A phone overview cannot make every embedded label comfortably readable; the localized caption provides the main interpretation and the large-image viewer supports detailed inspection.
- Both publication archives remain text-only. Homepage original-paper figures, PI content and member preferences remain unchanged, including Yin's personal reflection.

## Generation prompts

### 01 Rental

```text
Use case: scientific-educational
Asset type: English graphical abstract for an urban and economic geography research website, 1536 x 1024 landscape.
Primary request: Create a new, restrained, publication-quality graphical abstract for Li, Wei & Wu (2019), "Analyzing the private rental housing market in Shanghai with open data", Land Use Policy. Show the paper's distinctive argument: rental housing geography is tied to labor-market conditions as well as neighborhood access, so rental affordability cannot be understood without employment accessibility. Do not produce a generic housing-crisis poster.

Composition: white background, precise sans-serif typography, clear hierarchy and large readable labels. Two unframed comparative urban-context panels linked by a minimal transit line, with light orthographic architectural drafting used only as supporting imagery. The main subject is the contrast in relevant locational conditions, not a skyline. Give the text relationships the visual priority. A modest central-job cluster and a suburban residential/transport setting are schematic, not real maps or measured layouts. Use restrained charcoal, muted red and cool teal, with light gray urban linework. No watercolor, photorealism, dark title bars, card UI, exaggerated 3D miniatures, giant arrows, money icons or ornamental symbols.

Required exact text:
Title: "Renting has a distinct geography"
Small subtitle: "Labor-market conditions meet neighborhood access"
Two area labels: "INNER CITY" and "SUBURBS"
Inner-city findings: "High-paying jobs" and "High rents"
Suburban findings: "More affordable rents" and "Transport access matters"
A shared framework, compact but readable: "Jobs · Salaries · Migrant population" and "Transit · Service amenities"
Bottom main takeaway: "Rental affordability is also access to jobs"
Small evidence-boundary line: "Spatial associations, not causal estimates"
Citation: "Li, Wei & Wu (2019) · Land Use Policy"
Footer: "Conceptual synthesis; urban layouts are schematic"

Scientific constraints: Findings are relative and context-dependent. Do not imply all urban-center renters are rich or all migrants live in suburbs. Do not draw a uniform positive effect for migrant population: its association differs by urban zone. Do not invent actual rent amounts, rent ratios, observed commute flows, statistical curves, causal paths, survey respondents, mobile traces or search data. If connectors are needed, use neutral thin rules or brackets, not causal arrowheads. No national outline, no Shanghai map, no scale bar or north arrow. Any illustrative commuting link must be clearly conceptual and have no flow widths or volume claims.
Visual goal: A sophisticated economic-geography research graphic with one strong comparison, not a decorative list of icons. Keep sufficient contrast and generous but purposeful spacing, no overlapping or clipped labels.
```

### 02 Housing prices

```text
Use case: scientific-educational
Asset type: English graphical abstract, 1536 x 1024 landscape, for a serious urban-geography research website.
Primary request: Create a publication-quality graphical abstract for Li, Wei, Wu & Tian (2019), Cities, "Analyzing housing prices in Shanghai with open data: Amenity, accessibility and urban structure". The paper's contribution is an integrated housing-price framework in which urban structure conditions the associations of dwelling attributes, transport access, and service amenities. A global city can remain monocentric in its housing market while different urban zones value location differently.

Style: restrained technical cartographic diagram, crisp flat spatial geometry and finely drafted urban grain, not watercolor, not a 3D miniature or price mountain. White page, charcoal text, teal, muted terracotta, light neutral gray. Typography must be precise, large and consistent. An unframed editorial composition with a small spatial key and three clearly separated evidence rows. No dark banner, no floating cards, no giant promotional arrows, no list of generic pictograms.

Composition: a small, purely schematic three-zone radial diagram takes at most one third of the width. It shows three concentric zones with fine boundaries and sparse abstract gray block grain, NOT real Shanghai administrative boundaries. No coastline, river, north arrow, scale bar, measurement legend, plotted price heights, economic data points, or numerical values. To its right occupy most of the page with three aligned urban-zone evidence rows, each connected by a thin neutral leader to its corresponding zone. The innermost zone is distinctly labeled INNER CITY; intermediate zone EXPANDED INNER CITY; outer zone SUBURBS. Do not swap zone labels. For the evidence rows, use readable sentences instead of quantified bars, badges or checkmarks. The contrasts are relative, not exclusive.

Required text verbatim:
Title: "Urban structure conditions housing value"
Subtitle: "One housing market, different locational associations"
Compact framework line: "Dwelling attributes · Transport access · Service amenities"
Row 1 heading: "INNER CITY"
Row 1 main text: "Public and private service amenities"
Row 2 heading: "EXPANDED INNER CITY"
Row 2 main text: "Metro access and service amenities"
Row 3 heading: "SUBURBS"
Row 3 main text: "Public transport access is especially important"
Large bottom takeaway: "The same attributes do not matter equally everywhere"
Citation: "Li, Wei, Wu & Tian (2019) · Cities"
Footer: "Conceptual synthesis; rings are schematic, not mapped boundaries"
Small caution line: "Relative associations, not exclusive preferences or causal effects"

Scientific invariants: The ring geometry is a conceptual representation of the comparison, not an empirical price map. No smooth estimated curves, 3D interpolations or price surfaces. Do not imply amenity associations disappear in suburbs or transport is irrelevant in the inner city. Do not imply this paper established a causal mediation effect. Do not invent a universal optimal density or a new theory name. Diagram should convey spatial heterogeneity, not merely say three generic factors cause price. All labels must fit, with no clutter or clipped text.
```

### 03 Employment

```text
Use case: scientific-educational
Asset type: English graphical abstract, landscape 1536 x 1024, for an academic urban and economic geography website.
Primary request: Create a sophisticated, source-faithful new graphical abstract for Li, Wei & Wu (2019), Habitat International, "Urban amenity, human capital and employment distribution in Shanghai". The contribution is NOT proof of a jobs-people-jobs causal cycle. It tests human-capital / amenity-oriented explanations within one metropolis and shows their applicability differs between producer services and manufacturing. Social-review measures of amenity popularity provide a culturally situated intra-urban measure.

Visual style: an analytical economic-geography comparison plate. White background; charcoal sans-serif labels; muted blue for producer services and muted ochre for manufacturing; fine gray geometry. A restrained flat technical diagram, not watercolor, not isometric 3D, no futuristic skylines, no large decorative icons, medal circles, brains, graduate caps, money, triangle causal loop, giant arrows, framed cards or dark footer bars. Differentiate it clearly from a housing-price poster.

Composition: Two balanced unframed columns for two sectors. In each column, a modest top-down abstract employment-and-service configuration forms the supporting visual, using simple gray building footprints and restrained colored facility marks. No actual Shanghai boundary, coastline, river, north arrow, scale bar, numerical key, invented regional network or measured density. Use neutral fine connecting rules to express association between an employment group and its corresponding emphasized factor, not cause and effect. Keep labels in large readable type and visual marks subordinate to the comparison. Each panel should have one clear statement, not a long checklist. A shared small methodological strip links the columns. Bottom has one main theoretical takeaway and a visible causality caveat.

Required exact text:
Title: "Amenity theory is sector-dependent"
Subtitle: "An intra-urban test in Shanghai"
Left heading: "PRODUCER SERVICES"
Left factor: "Private-service popularity"
Left supporting examples: "Restaurants · Entertainment · Healthcare"
Right heading: "MANUFACTURING"
Right factor: "Transport infrastructure"
Right supporting examples: "Roads · Local population"
Between factors and sector labels, or shared above both columns: "Relatively closer associations"
Method line: "Dianping comments · Spatial regression · Subdistrict comparison"
Main conclusion: "Human-capital theory offers a partial explanation"
Caveat: "No causal direction established between amenities and jobs"
Citation: "Li, Wei & Wu (2019) · Habitat International"
Footer: "Conceptual synthesis; locations are hypothetical"

Scientific constraints: Both sectors may be associated with amenities and infrastructure. Do not draw exclusive determinants, crossed-out factor classes or a binary significant/not-significant matrix. The source supports comparatively greater relevance of private-service amenities to producer-service jobs and infrastructure/local population to manufacturing. Actual skilled-worker sorting or mediation was not observed; do not illustrate human capital as a measured intermediary. Review comment counts indicate popularity, not automatically satisfaction or objectively measured facility quality. Do not invent effect sizes, R-squared, commuter volumes, causal claims, quotes from reviews, distributions or locations. Show a theoretical boundary and sectoral comparison, not merely a manufacturing-versus-office cityscape.
```

### 03 Targeted label correction

```text
Use case: text-localization
Edit target: this graphical abstract for Li, Wei & Wu (2019), Habitat International.
Make only a targeted conceptual-label correction in the right MANUFACTURING column. Local population is a separate explanatory condition, not a form of transport infrastructure.
Replace the right factor label "Transport infrastructure" with exactly "Infrastructure and population".
Replace the supporting text "Roads · Local population" with exactly "Road network · Population size".
Fit both new lines cleanly in their current locations, using a slightly smaller consistent font if necessary. Preserve the panel geometry and all other text, colors, thin neutral association connectors, source citation, hypothetical-location footer and the visible no-causal-direction caveat unchanged. Do not add arrows, labels, data, icons or additional facilities. Preserve the left panel exactly.
```

