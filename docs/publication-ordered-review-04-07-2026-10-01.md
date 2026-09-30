# Ordered publication review: entries 04, 06 and 07

Date: 2026-10-01.

## Scope and order

This batch follows entries 01-03 and covers innovation networks (2019), housing submarkets (2020) and firm suburbanization (2020). Entry 05, the doctoral dissertation, is deliberately text-only at the user's request. It now has an explicit false visual flag and a regression check to preserve that decision. No historical draft files were deleted.

Next in source order: entry 08, regional inequality and place mobility in Jiangsu (2020), followed by trip chains (2021) and amenities/creativity (2022). A finished batch is not completion of the entire archive.

## Decisions and source evidence

| Entry | Decision | Problem in old graphic | Source checked | Final asset |
| --- | --- | --- | --- | --- |
| 04 Innovation network capabilities | Redo; verify previously disabled summary | Generic acquisition/control machinery, causal chain to sustainable outcomes and global-to-local switch exceeded the evidence. | Supplied Sustainability PDF, framework/definitions pp. 5-6, network inequality pp. 9-11, spatial-regime comparisons/Tables 3-5 pp. 14-16, conclusions pp. 16-17. | `images/publications/network-access-control-2019-v2-reviewed.png` |
| 05 Doctoral dissertation | No graphic | User explicitly excluded the dissertation. | No illustration or new source analysis is required. | None |
| 06 Housing submarkets | Redo figure; retain verified bilingual summary | Four cartoon groups placed beside "43 submarkets" could be mistaken for the real output, and star-like house links obscured the definition of connectivity. | Supplied ASAP PDF, data/framework pp. 7-8 and Fig. 2, DBSCAN distance/density rules pp. 12-13, actual 43-market result/Fig. 5 p. 18, conclusions pp. 29-30. Fig. 2 and Fig. 5 were visually inspected. | `images/publications/housing-connectivity-2020-v2-reviewed.png` |
| 07 Firm suburbanization | Redo; verify previously disabled summary | Large outward arrows implied tracked relocations, a three-scale hierarchy was not the analyzed local/neighborhood comparison, and manufacturing's new-edge preference was overgeneralized. | Supplied Professional Geographer PDF, abstract p. 2, variables/scales pp. 7-8, general/branch results and Tables 5-7 pp. 15-17, conclusions p. 18. Table 6 was visually inspected. | `images/publications/firm-sector-neighborhood-2020-v2-reviewed.png` |

## Scientific and visual boundaries

- Network acquisition uses degree centrality; control uses betweenness. Examples show direct connections versus brokerage between groups, not actual city networks. Spatial-regime signs differ by region and period, so the graphic does not claim universally positive innovation effects or separately proven sustainability outcomes.
- Housing substitutability is proxied through hedonic residuals. Connectivity uses proximity and density, not commuting, road links or observed household substitutions. The parcel demonstration is hypothetical; the 43-market empirical result is reported separately. Original Fig. 2 was an engine input as a conceptual reference, not a pixel-preserved reproduction.
- Firm growth is measured through establishment counts, not jobs or observed relocations. Producer services have central/nearby and new-edge growth; manufacturing shows suburbanizing growth without a general-model preference for new land expansion. Community conditions still matter locally for manufacturing. The surrounding-neighborhood inset explicitly excludes the central block group.
- Generated plan-view grain is hypothetical, not Salt Lake County geography. No China-wide outline or real map was freely redrawn.
- A housing first draft introduced unwanted badge icons and duplicate paragraphs. Two targeted engine edits removed that decoration and restored the three named theoretical principles.
- A firm first draft did not sufficiently distinguish the local block group from its surrounding neighborhood. A targeted edit added a white cutout and the explicit exclusion label.
- Selected images were created through the built-in image-generation tool, without API keys or CLI fallback. The tool exposes no backend model identifier.
- Only previously unreviewed network/firm summaries are newly enabled. Verified housing contributions and findings, bibliographic metadata, homepage selection and member content remain unchanged. Yin's personal reflection remains intact.

## Saved outputs

The selected PNGs are in the asset paths listed above. Each has small (480px), medium (960px) and full-size WebP siblings, generated in one scoped optimization run. Earlier assets were not regenerated.

Selected engine originals:

- Network: `C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-28fd7f39-0517-4f8b-bd61-bf2acb31780a.png`
- Housing: `C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-7a048bfb-b854-48b4-a330-bbe384c28946.png`
- Firms: `C:/Users/admin/.codex/generated_images/019df1d7-7baa-79b3-91bb-a73cd47713cc/exec-e489ae43-4806-4495-b967-187c237c6654.png`

## Verification

- Complete Jekyll build and bilingual site verification passed for all 33 records, including nine specifically checked refined figures.
- All four publication-filter tests passed. Existing housing contribution and findings were retained. Scoped image optimization changed only the three new asset sets and their manifest entries.
- Both languages were exercised at desktop 1440px and mobile 390px widths for all three detail pages: 12 combinations, loaded images, paired language navigation, no horizontal page overflow and no page-script errors.
- Each full-size viewer loaded the 1536px source, zoomed correctly, returned to fit width and closed correctly. Desktop display width is 850px and mobile display width is 342px. Phone overviews do not make every embedded annotation comfortably readable; bilingual captions and the full-size viewer provide the explanation and detailed inspection.
- Both dissertation pages contain no figure or image viewer. Both archives have 33 text-only entries and no entry images. Homepage selection and member preferences remain protected by the full-site checks.
- Medium WebP sizes: network 70,040 bytes, housing 79,410 bytes, firms 100,782 bytes. All are below the 300 KB default-figure budget.
- The preceding batch (commit 7efe195) was independently confirmed deployed successfully, including both languages and byte-verified large images. This batch's deployment is verified separately after publishing the reviewed commit.

## Generation prompts

### 04 Innovation networks

```text
Use case: scientific-educational
Asset type: English graphical abstract, 1536 x 1024 landscape, urban and regional economic geography.
Primary request: Create a refined research graphic for Li, Wei, Miao, Wu & Xiao (2019), Sustainability, on innovation network capabilities in China's biotechnology sector. The contribution distinguishes two relational capabilities within scientific and technological knowledge networks: acquiring knowledge through direct connections and controlling circulation through brokerage. Do NOT portray generic connected cities or a universal positive causal effect of centrality.

Style: crisp analytical network visualization, white background, restrained charcoal, clear indigo-blue and rust highlights. Large readable sans-serif labels. No geographic base map, no national silhouette, no location-like layouts, no globe, no skylines, no laboratory clipart, no badge icons, no rounded cards, no gradients, no 3D, no watercolor. The topology itself must carry the conceptual distinction.

Composition: one pair of unframed topology demonstrations occupies the center. LEFT: a highlighted focal node linked directly to surrounding peer nodes, emphasizing access through connections. RIGHT: two compact gray groups linked by a highlighted brokerage node, clearly showing that the bridge role concerns paths between groups. These are conceptual examples, not extracted empirical networks. Use simple nodes and thin edges with no arrowheads or numerical weights. The two examples should be balanced and easy to distinguish, not an ornate dense graph. Labels are the main hierarchy; the networks support them.

At top, below the title, two simple lines identify the empirical sources: "Scientific knowledge: co-authored papers" and "Technological knowledge: co-applied patents". A restrained lower evidence line says that control capability is more concentrated, with regional and temporal qualifications clearly retained.

Required exact text:
Title: "Network access is not network control"
Subtitle: "Two capabilities in innovation networks"
Left heading: "ACQUISITION"
Left label: "Direct knowledge connections"
Left metric: "Degree centrality"
Right heading: "CONTROL"
Right label: "Brokerage between groups"
Right metric: "Betweenness centrality"
Sources: "Scientific knowledge: co-authored papers" and "Technological knowledge: co-applied patents"
Evidence line: "Control capability is more concentrated"
Takeaway: "Innovation performance depends on network type and regional context"
Small qualification: "Patterns vary across regions and periods"
Citation: "Li, Wei, Miao, Wu & Xiao (2019) · Sustainability"
Footer: "Conceptual topology; not measured networks or causal estimates"

Scientific constraints: Use no actual city labels, rankings, historical effect curves, sample counts, invented regression signs or green growth outputs. Do not state that both centrality metrics are always positively associated with innovation: the paper's spatial-regime results vary across periods and regions. Degree means connections, betweenness concerns paths, and neither is an estimated knowledge-flow volume. Sustainable development is a policy implication, not an independently identified causal outcome. No map of China. Keep all exact labels legible and entirely within the page.
```

### 06 Housing submarkets

```text
Use case: scientific-educational
Asset type: Source-faithful English graphical abstract, 1536 x 1024 landscape, for urban and economic geography research.
Input image: a rendered original PDF page containing Figure 2. Use it ONLY as a reference for the paper's conceptual and analytical framework, not as a page to copy and not as a visual style reference.
Primary request: Rebuild a clearer, sophisticated graphic for Wu, Wei & Li (2020), Applied Spatial Analysis and Policy, "Analyzing Spatial Heterogeneity of Housing Prices Using Large Datasets". The advance is combining similarity, substitutability and spatial connectivity in a computationally feasible hybrid classification of large parcel-level datasets. Spatial connectivity is distance-and-density based and can tolerate leapfrog patterns; it does NOT mean commuting links, road networks or direct house-to-house exchange.

Composition: white, landscape editorial page. Precise flat spatial-analysis / algorithm visualization with teal, charcoal and restrained vermilion, consistent sans serif. No decorative 3D city models, clipart houses, watercolor, huge arrows, gradients, floating cards or dense text blocks. Main central element is a modest conceptual point-pattern demonstration, about one third of the canvas, accompanied by three readable principles using the rest of the width. The points represent hypothetical parcels, not actual data. Show two dense groups of the SAME teal point class that have a small gap; faint overlapping search-radius circles indicate proximity-and-density connectivity. A few separate orange points suggest a different attribute class. No lines resembling transport connections, no arrows between individual points, no continuous filled territorial border. Label this demonstration "Schematic parcel pattern" so no reader mistakes it for the 43 empirical submarkets.

Three clearly aligned principles with these exact labels and descriptions:
"SIMILARITY" / "Housing and neighborhood attributes"
"SUBSTITUTABILITY" / "Similarity in price mechanisms"
"SPATIAL CONNECTIVITY" / "Distance and density, not strict continuity"
Place these in an unframed vertical column, clearly explaining the point-pattern demonstration. Do not present substitutability as observed household switching: the paper uses hedonic-model residuals as a proxy.

Below the main concept, a compact horizontal method line, not a causal chain, labeled "Hybrid spatial clustering":
"Spatial weighting" — "Two-step clustering" — "Density-based splitting" — "Outlier reassignment"
Use thin neutral connectors without large arrowheads. This is a sequential computational procedure, not a causal claim.

At the bottom separately report the ACTUAL empirical result with no fake map or four mock markets:
"Salt Lake County · About 240,000 houses · 43 submarkets"
"Local models improve prediction and market interpretation"
A clean restrained hierarchy; result numbers must not dominate the theory.

Required top text:
"Connected submarkets, not just continuous areas"
"Market definition links attributes, price processes and spatial relationships"
Citation: "Wu, Wei & Li (2020) · Applied Spatial Analysis and Policy"
Footer: "Conceptual pattern; not the observed submarket map"

Constraints: No actual geographic map, no national silhouette, no Salt Lake outline or scale bar. Do not draw a few colored territories with a label claiming they are all 43 observed submarkets. No claimed mobility network or observed customer substitutions, no new percentages, fabricated price values or causal estimates. The density circles are illustrative only, not the paper's calibrated distance setting. All labels readable and unclipped. Keep the scientific contribution visually primary.
```

### 06 Visual simplification

```text
Edit this graphical abstract for a more restrained academic spatial-analysis style. Preserve the title, subtitle, citation, hypothetical parcel point pattern, source-qualified 240,000-house / 43-submarket result, and scientific meaning. Change ONLY the visual hierarchy and excess decoration: remove all three large circular icon badges in the right column and all four icons / rounded colored boxes in the bottom method line. Make the three principles unframed aligned text labels; keep ONLY their main descriptors: "Housing and neighborhood attributes", "Similarity in price mechanisms", "Distance and density, not strict continuity". Remove the extra explanatory paragraphs under substitutability and connectivity, which duplicate the website text. Keep the right column airy but not empty. Make the parcel demonstration about 45% of width, not dominant, and label it "Schematic parcel pattern"; retain its two attribute classes and translucent overlapping illustrative distance circles, never add roads or measured geography. Bottom procedure is four plain labels joined by short thin neutral rules with no arrowheads: "Spatial weighting" / "Two-step clustering" / "Density-based splitting" / "Outlier reassignment", under "Hybrid spatial clustering". Preserve the two bottom result lines and footer verbatim. Keep a white background with charcoal, teal and sparse orange; flat, precise, journal-style, no cards, badges, pictograms, gradients, glow, 3D or watercolor. Do not invent new findings, quantities or causal claims. Keep the landscape 1536 x 1024 framing, balanced margins, consistent readable typography.
```

### 06 Restore named principles

```text
Make one precise text correction to this graphical abstract, preserving every other image element, diagram, size, layout, colors, white background, method line, footer and result. The three right-side principle rows must each have TWO levels: a small charcoal uppercase heading above its existing large teal descriptor. Restore these exact headings: above "Housing and neighborhood attributes", add "SIMILARITY"; above "Similarity in price mechanisms", add "SUBSTITUTABILITY"; above "Distance and density, not strict continuity", add "SPATIAL CONNECTIVITY". These named principles are scientifically essential and must not be omitted. The headings and descriptors must fit within their current row areas with clear hierarchy. Change nothing else and do not add icons, boxes, paragraphs or findings.
```

### 07 Firm suburbanization

```text
Use case: scientific-educational
Asset type: English graphical abstract, landscape 1536 x 1024, urban and economic geography.
Primary request: Create a restrained, source-faithful research graphic for Wu, Wei & Li (2020), The Professional Geographer, "Firm Suburbanization in the Context of Urban Sprawl: Neighborhood Effect and Sectoral Difference". The theoretical point: suburban firm growth is NOT a single outward migration or necessarily a declining core. Producer services combine center / nearby growth and growth at newly developed edges; manufacturing shows suburbanizing growth. Local and surrounding-neighborhood associations differ, and producer services have internal branch differences.

Style: refined geographical / economic-spatial analytical illustration, precise plan-view city grain, white background, charcoal, muted cobalt for producer services and rust for manufacturing. No hand-painted or watercolor style, 3D island cities, graduation caps, giant arrows, shaded cards, dark banners, gradients, generic icons or promotional skyline.

Main composition: two unframed schematic horizontal spatial strips with sparse low-contrast gray blocks supporting the findings. Each strip has an urban center at left, established suburbs in middle, new development edge at right, with three clear shared location labels. This is a categorical geographical comparison, not a smooth measured gradient.
Top strip "PRODUCER SERVICES": emphasize TWO separately annotated growth areas, center / nearby and new edge. Use uniform-size cobalt points in clusters as qualitative markers. Text labels: "Center and nearby growth" and "Growth at new development edges". No arrows suggesting firms relocated and no declining center.
Bottom strip "MANUFACTURING": uniform rust points emphasize suburbs, not a special preference for newly developed edges. Text label: "Suburbanizing growth". Do NOT say manufacturing follows new urban expansion: expansion was insignificant for manufacturing in the general model.
A small shared note directly beneath: "Schematic growth patterns, not relocation tracks or observed counts". Point numbers and density are conceptual, not data.

Lower third: a compact geographic scale inset: one gray block group as central square, surrounded by an unfilled ring clearly marked "Surrounding neighborhood"; the inner square is marked "Local block group". Ring excludes the central square, representing an analytical comparison between local census block groups and surrounding one-mile neighborhoods, NOT a drawn actual 1-mile map. Two readable statements beside it:
"Producer services: community associations extend into nearby areas"
"Manufacturing: surrounding-neighborhood associations mainly reflect agglomeration"
Do not make manufacturing independent of community conditions at the local scale. A final compact qualifier says "Producer-service branches differ in their locational preferences".

Required top:
"Suburban growth does not mean core decline"
"Sector and neighborhood scale change the explanation"
Shared spatial labels: "Urban center" / "Established suburbs" / "New development edge"
Evidence line: "Salt Lake County · Firms 2000–2010"
Citation: "Wu, Wei & Li (2020) · The Professional Geographer"
Footer: "Conceptual synthesis; spatial layouts and symbols are schematic"

Scientific invariants: Use no actual Salt Lake geographical outline, roads as measured flow paths, statistical bars, regression curves, observed relocation arrows, quantitative dot counts or new percentages. Firm establishment counts are not employment counts. Do not claim a demonstrated causal filtering process. Do not generalize that rail or density uniformly has no effect across all service branches. The key is simultaneous central and peripheral growth with sectoral and scale-sensitive explanations, not a generic urban-sprawl story. Keep only the requested labels; unclipped, balanced and clearly hierarchical.
```

### 07 Correct neighborhood exclusion

```text
Make ONLY one precise scientific correction to the lower-left neighborhood-scale inset. Preserve the two upper schematic firm-growth strips, all points, titles, labels, findings, colors, landscape size, white background and other layout unchanged. The surrounding neighborhood excludes the local block group. In the inset, make the central block-group square a clean white cutout with a charcoal outline and retain its leader "Local block group". Represent the surrounding neighborhood as a light-gray annular area around, but NOT including, that central square, with an outer dashed circular boundary. Change the surrounding leader text to "Surrounding neighborhood" with a smaller second line "(excluding local block group)". No other additions or findings, no numerical scale, no geographic map. Both leaders must terminate on the correct separate areas and the two labels must fit without overlap.
```
