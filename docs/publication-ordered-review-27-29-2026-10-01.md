# Ordered publication figure review: entries 27-29

Date: 2026-10-01

## Decisions and evidence

- 27. Liu et al. (2025), Land Use Policy: replace the unreviewed glossy illustration with an ecological-geography conceptual diagram. Primary publisher abstract, highlights and introduction: https://www.sciencedirect.com/science/article/abs/pii/S0264837725000754 (DOI 10.1016/j.landusepol.2025.107541). No full PDF was supplied. Verified: 19 urban agglomerations, 2000-2021; direct conversion versus indirect enhancement or weakening; dynamic UEI and VI thresholds, higher UEI thresholds in humid zones, lower VI thresholds in semi-arid zones. Do not replace these with generic cool/warm categories, invented 3D fitted surfaces or numerical threshold locations. The proposed land-management framework is not a tested intervention. Second engine pass removed presentation cards, climate icons and photo cutout while preserving evidence.
- 28. Qu, Wu & Liu (2025), Applied Spatial Analysis and Policy: retain amenity-housing-framework-v2-reviewed.png. Re-read supplied PDF pp. 1, 5-6 and 22. Four dimensions and their accessibility/activity grouping agree with Fig. 1. Private-service quality versus essential-service quantity and quality and nonlinear context dependence agree with the abstract. Cross-sectional limitations remain in caption. Hypothetical neighborhood is not Wuhan geography.
- 29. Teng, Wu & Liu (2025), Applied Geography: retain amenity-industry-nested-v2-reviewed.png. Re-read supplied PDF pp. 1, 10 and 13, with earlier source check of Fig. 1. Metropolitan competitive advantage and local placemaking are nested, not uniform prescriptions; central innovation conditions and peripheral public-service/accessibility requirements are supported. Schematic sectors and points are explicitly hypothetical. Existing conceptual arrows are not estimated causal effects. Corresponding authorship unchanged.

## Final assets

- images/publications/vegetation-dynamic-context-2025-v2-reviewed.png (1536 x 1024), final engine original exec-ee1625f6-36bf-4dff-9b49-4e96db9bbc92.png. Initial visual draft exec-cdc32dcc-d1f5-43e8-917d-c420386a1bd1.png not used.
- images/publications/amenity-housing-framework-v2-reviewed.png (retained).
- images/publications/amenity-industry-nested-v2-reviewed.png (retained).

Built-in image-generation tool, not CLI/API. No exposed backend model identifier. Engine originals: C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/. Repository optimizer makes responsive variants without semantic edits. Archives remain text-only; no dissertation figure.

## Prompt set

### Vegetation dynamic-context figure

```text
Use case: scientific-educational.
Asset type: publication-quality English graphical abstract for an urban-ecology/geography paper, landscape 1536 x 1024, opaque white.
Explain only verified claims from Liu, Luo, Huang, Wu & Zhou (2025), Land Use Policy 153, 107541, DOI 10.1016/j.landusepol.2025.107541. Source is publisher abstract and introduction, not full PDF. Study: 19 Chinese urban agglomerations, 2000-2021, a framework joining urban expansion intensity (UEI), vegetation index (VI) and time. Two indirect-response threshold dimensions are UEI and VI; these vary by climate, with higher UEI thresholds in humid zones and lower VI thresholds in semi-arid zones. Direct impact is vegetation loss through replacement by impervious surfaces; indirect responses of remaining vegetation can be enhancement OR weakening. Do not imply all indirect impacts are positive or cancel direct loss. The conceptual innovation is dynamic and context-dependent thresholds rather than a fixed snapshot.
Style: refined ecological-geography scientific plate, crisp thin technical lines and legible contemporary sans-serif, white, forest green, muted terracotta, dark charcoal, teal. No hand-drawn watercolor, glossy 3D icons, giant city dioramas, dark cards, globes or China outline.
Headline exactly "Vegetation thresholds change with time and climate". Subtitle "Direct land-cover loss and indirect vegetation responses are different".
Main composition:
LEFT, about one-third: two small accurately aligned hypothetical 6-by-6 land-cover grids, not cartographic geography, showing before and after expansion. Same grids aligned; a subset of green vegetated cells becomes grey impervious cells, while other vegetation stays green. Label "DIRECT" above and "Vegetated land replaced by impervious surfaces" below. Add one restrained magnified vegetation leaf/patch technical botanical inset at the remaining green land, labeled "INDIRECT" and "Remaining vegetation: enhancement or weakening". No numerical legend, fabricated percentages, climate-zone maps or measured satellite imagery.
CENTER/RIGHT, about two-thirds: a prominent unboxed framework linking a top row "TIME" and "CLIMATE CONTEXT" to a bracket enclosing TWO clearly separated aligned concepts:
"UEI threshold" / "Urban expansion intensity"
"VI threshold" / "Vegetation index"
Use thin neutral connectors labeled collectively "Dynamic response thresholds" that represent conceptual dependence, NOT tested causal paths or actual temporal trajectories. No coordinate plots, S curves, 3D response surfaces or invented threshold positions.
Below these two threshold labels, align verified contextual contrasts:
under UEI: "Higher in humid zones"
under VI: "Lower in semi-arid zones"
Keep these qualifiers paired correctly. Do not substitute cool/warm zones.
Bottom takeaway "Land management must address both direct loss and context-specific indirect responses". Small source line "Liu et al. (2025) | Land Use Policy" and "19 urban agglomerations, 2000-2021. Conceptual synthesis; grids are hypothetical, not data."
Professional balance of graphics and text, use visual comparison and conceptual brackets instead of a wall of text. All text correct and readable. The two grids are diagrammatic land cover only; their cell totals and arrangement are not findings. Do not fabricate effect magnitudes, imply that higher expansion always improves vegetation, rank greening benefits, or show exact fitted response curves.
```

### Targeted visual refinement

```text
Refine this scientific graphical abstract's VISUAL STYLE while preserving all its scientific distinctions and correct labels. Make it feel like a sober Land Use Policy / ecological geography figure, not a presentation template. Keep 1536 x 1024 landscape, white background.
Keep exact headline "Vegetation thresholds change with time and climate", direct/indirect distinction, paired hypothetical before/after grids, dynamic threshold bracket, correctly paired UEI/humid and VI/semi-arid findings, and the 19 urban agglomerations / 2000-2021 source footer.
Remove ALL rounded colored panels and dark rounded takeaway banners. Set their text directly on white with consistent aligned columns, subtle thin grey rules only if needed. Use smaller compact, sharply readable sans-serif type, charcoal, muted forest green and restrained terracotta accents.
Remove the clock, sun, cloud, rain and seedling ICONS entirely. "TIME" and "CLIMATE CONTEXT" should be simple text on white, connected to the dynamic-threshold bracket. Remove the two illustrated climate landscapes; replace them with clean text-only findings "Higher in humid zones" and "Lower in semi-arid zones" aligned under their respective threshold labels. Do NOT draw a climatic map.
Replace the circular photographic leaf inset with a small delicate scientific botanical line drawing, black/green technical hatching, no watercolor or badge. It illustrates remaining vegetation and its enhancement OR weakening, not a measured species experiment.
Render the before/after land-cover grids as restrained technical diagrams: consistent grey street/impervious cell hatching and green vegetated cell hatching rather than tiny buildings or cartoon grass icons. Preserve the matched grid arrangement and direct conversion comparison; call them "Hypothetical land-cover grids" in small plain text nearby.
Bottom takeaway should be a plain left-aligned dark sentence without background or icon: "Land management must address both direct loss and context-specific indirect responses".
Do not add fitted curves, threshold magnitudes, big landscapes, extra text, decorative cards or false positive-only indirect effects. Preserve the existing evidence boundary and source information.
```

## Verification

- Jekyll build and site verification passed: 33 paired publication records, 27 exact figure mappings, text-only archives and text-only dissertation.
- All 4 publication filter tests passed.
- Playwright passed all 12 combinations across EN/ZH and 1440 x 1000 / 390 x 844: no overflow or page errors; language switch, full-resolution viewer, zoom, fit and close passed.
- Visually inspected six screenshots in E:/Work/2026/个人网站/研究图草稿/2025-植被设施-20261001/. Default medium bytes: vegetation 91060, housing amenities 72018, industry amenities 68290.
- Only the new vegetation asset optimized. Temporary preview browser and server stopped.
