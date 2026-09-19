# Contribution-first comparison and refinement

Date: 2026-09-19. Compared the six watercolor illustrations with the six
discipline-specific replacements at commit 428a22f. A style change is not proof
of improvement. Keep a replacement only if it improves the research explanation
without obscuring evidence or suggesting fabricated geography.

## Comparison decisions

| Paper | Assessment of 428a22f versus watercolor | Action |
| --- | --- | --- |
| Polycentricity | Spatial concentrations versus functional links are more direct than building medallions. The same five centers keep the comparison intelligible. | Keep the cartographic version. |
| Housing tenure | Connecting both markets to both opportunities communicates relative, not exclusive, preferences more accurately than two separate sets of buildings. Still text-heavy, but conceptually clearer. | Keep the institutional version. |
| Amenity dimensions | Grouping quantity/quality and mix/arrangement is clearer. The quality symbol remains simplified; it must not be read as a measured score. | Keep for now; no new empirical claims. |
| Industry location | The large fictional map and glossy industrial-park rendering replaced watercolor but did not explain the two theoretical mechanisms. | Replace with a source-led mechanism figure. |
| Park equity | Repeating an identical street diagram consumed the main visual area and left experienced inequity largely as a sentence underneath. | Replace with the joint assessment framework and a specific empirical anchor. |
| Amenities and creativity | Count-versus-share dot patterns clarified definitions but removed the paper's result about amenity associations and metropolitan position. | Restore coexisting relationships and the CBD-to-suburb contrast. |

The aim is not to claim that abstract graphics are always better than illustration.
Hand drawing remains reserved for genuine design scenarios. These three papers
need conceptual and spatial reasoning, not picturesque architecture. The final
figures remain author-website interpretations, not publisher-provided artwork.

## Source checks

- Industry: supplied `Teng25JAPG_Amenity and KI.pdf`, pp. 1, 3-4 and 13.
  Figure 1 (p. 4) was rendered and supplied to the image engine as a scientific
  reference. Metropolitan potential access/competitive advantage and local
  availability/diversity/placemaking are retained. Connections indicate a proposed
  framework, not causal estimates.
- Park equity: supplied `Wu25LAUP_Park equity.pdf`, pp. 1 and 9-11. Preserve
  objective access/quality, perceptions, needs, use changes and urban/peri-urban
  comparison. The western community's similar objective access, greater basic
  infrastructure needs and vulnerability to quality-perception problems are
  observational findings; do not imply equal park quality.
- Creativity: supplied `Wu22Cities_Amenity and creativity.pdf`, pp. 1, 4 and 16.
  Figure 1 (p. 4) was rendered and supplied as a scientific reference. Co-location,
  accessibility and clustering coexist; the CBD/suburb comparison is qualitative.
  Equal thin line lengths do not encode an estimated coefficient, cutoff or flow.

## Final assets and generation

Built-in image generation only, one initial call and one targeted correction per
accepted image. No external image API/key or exact model-version claim. Generated
PNGs are saved in the repository; responsive WebP copies preserve their content.
All backgrounds are white and all three are conceptual illustrations.

### Industry location

Final asset: `images/publications/amenity-industry-mechanisms-reviewed.png`.

Initial prompt:

```text
Create a new, substantially improved landscape graphical abstract for the supplied Applied Geography paper, using the original Figure 1 on the supplied page as the SCIENTIFIC reference. Do not reproduce the page or its prose. This is an author-website interpretation, not an official publisher figure.

The previous design failed because a large fictional city plan and a glossy industrial park occupied most of the image without explaining the research. Replace that with the actual contribution: amenity-related METROPOLITAN COMPETITIVE ADVANTAGE and LOCAL PLACEMAKING are distinct, interdependent mechanisms of industrial attractiveness. Metropolitan potential resource access is not the same as immediate local access and diversity. Urban spatial context matters. This is the authors' proposed framework, not causal estimates.

Composition and craft: 1536x1024, opaque pure white. A polished economic-geography research plate, precise thin technical linework, charcoal with teal for metropolitan reasoning and restrained terracotta for local reasoning. No watercolor, sketches, 3D buildings, scenery, city map, flow magnitudes, graphs, stock icons or cards. No poster-sized slogan.
Moderate clean sans-serif title: "Two mechanisms of industrial attractiveness"

At the center, two INTERCONNECTED analytical pathways, not two decorative city pictures:
Left heading "METROPOLITAN SCALE". Beneath, a small but carefully crafted geographical network schematic: three compact clusters of tiny gray resource points joined by thin teal inter-area connections, NOT actual city geography. This schematic occupies at most one sixth of the image. A fine leader labels it "Potential resource access". Below it a substantial label "Competitive advantage".
Right heading "LOCAL SCALE". Beneath, a same-size precise schematic of a single local firm point surrounded by a heterogeneous set of small amenity marks with thin short local connections, in terracotta and a few supporting neutral colors. A leader labels it "Availability + diversity". Below it a substantial label "Placemaking".
The pathways join neatly through two converging fine lines into the centrally located phrase "Place-based industrial attractiveness". The connecting structure should visibly explain combination, not depict a chronological sequence.
A long open bracket ABOVE the paired pathways reads "Urban spatial context". A small bridge between the two schematic levels reads "Nested scales". No arrow implying causal estimation.
At the bottom, one emphasis statement on two tidy lines:
"Placemaking is an economic mechanism"
"whose role depends on urban context"
Small footer: "Adapted from the proposed framework | Wuhan automotive-industry study | Conceptual schematics"
The diagram itself must communicate the cross-scale reasoning. Keep visual space economical, labels unambiguous and clearly readable at a 700px website width. No empirical geography, coefficients, unsupported causal claims or added text.
```

Targeted correction:

```text
Edit only the presentation styling of this figure. Preserve all words, the three metropolitan clusters and interconnections, the local amenity configuration around the Firm, nested-scales link, shared urban-context bracket and converging connection to place-based industrial attractiveness. No new content or claims.
Make it an elegant open journal figure rather than a boxed presentation:
- Remove both dashed rectangular enclosures and their colored header bands. Keep the two scale headings as teal/terracotta text on plain white.
- Remove the colored rounded backgrounds behind Competitive advantage and Placemaking. Retain these important labels as bold accent-color typeset text with a short fine rule above each.
- Remove the outline capsule behind Nested scales; keep its text on white between the interrupted fine dashed connector.
- Remove the dark capsule behind Place-based industrial attractiveness. Set that text in dark charcoal on white, with the two colored connections ending neatly on either side, never running through the text.
- Remove the filled versus outline variations among the right-side amenity symbols: use a small set of consistently filled simple circles, squares and triangles in muted complementary colors. They merely indicate heterogeneous amenities, not a measured ranking. Do not invent a legend mapping shapes to real types.
Keep completely opaque white, restrained academic layout, no new icons, no shadows, no watercolor, no 3D, no maps. Preserve readable type sizes and the theoretical takeaway at the bottom.
```

### Park equity

Final asset: `images/publications/park-equity-lenses-reviewed.png`.

Initial prompt:

```text
Redesign the supplied park-equity graphical abstract. The supplied image is the EDIT TARGET, but its repeated street grids must be removed, not polished. Create a new 1536x1024 opaque-white professional social-geography research graphic. Crisp digital analytical linework, strong visual hierarchy, no hand drawing, watercolor, landscape scene, stock illustration, decorative maps, 3D buildings, fake charts or numeric scores.

Source facts from Wu et al., Landscape and Urban Planning 256 (2025) 105269: objective park access and quality alone miss important experiential inequities. The study joins objective assessments with residents' perceptions, improvement needs and COVID-era changes in use, comparing urban and peri-urban communities. Urban-center and western peri-urban groups have similar measured access, yet perceptions differ; western communities have greater basic-infrastructure needs and their park use is more vulnerable to perceived quality problems. These are observational associations, not a causal chain.

Main thesis/title: "Park equity is more than resource distribution"
Make the PRIMARY graphic a well-composed two-lens assessment, in the top 60% after the title:
Left, an open green-bracket grouping with "OBJECTIVE PROVISION", and two modest precise geometric symbols labeled "Access" and "Quality". Access is a simple short route joining a residence point and a small park square; quality is the same park square with several tiny facility marks. These are small icons, not maps and not compared scores.
Right, a larger open plum-bracket grouping with "RESIDENT EXPERIENCE", containing three equally sized, clearly separated analytical nodes labeled "Perceptions", "Improvement needs", "Changes in use". Use compact geometric marks, NOT people clipart.
Both groups connect via smooth thin headless lines to one central label beneath them, "Context-specific equity assessment". A small line above the connection reads "Urban and peri-urban comparison". These are evidence components, not sequential causal steps.
No repeating road grids, no bars, no big illustrated scenes. The main graphic should occupy a useful amount of space without tiny legends.

Bottom 30%: a concise EMPIRICAL ANCHOR on white, separated by a fine horizontal rule. Small heading "WESTERN PERI-URBAN COMMUNITIES".
Lay out a left-to-right contrast, NOT a causal arrow:
left "Access similar to urban center"
center a thin contrast divider
right "Greater basic-infrastructure needs"
Beneath that, one smaller centered sentence:
"Park use was more vulnerable to perceived quality problems during COVID-19"
Do not claim that quality was equal or that all peri-urban communities were disadvantaged.
Footer: "Salt Lake City | Conceptual synthesis of observational findings"
Use restrained forest green and plum with charcoal, elegant editorial sans-serif, no shaded cards, no gradients, no unsupported text. Everything essential must be readable at a 700px website width. The purpose is to explain why objective provision is an incomplete equity lens, not to draw a generic park.
```

Targeted correction:

```text
Refine this scientific figure's visual sophistication while preserving EVERY word and every scientific relationship. Do NOT add findings, scores, maps or text. Opaque pure white, precise digital non-hand-drawn finish.

The current oversized filled clipart and thick rounded outlines resemble a presentation template. Correct only that problem:
- Replace the big speech bubble, checklist and calendar silhouettes with smaller delicate plum outline symbols of the SAME meaning; use uniform clean technical strokes, no solid colored blocks, no little extra labels. Reduce their area by about one third, keep the three columns evenly spaced. They are subordinate to the concepts, not the main attraction.
- Replace the solid green square under Quality with a small precise plan-view park outline with tiny facility marks, no scenic drawing, no filled tree/bench/playground silhouettes. Retain the existing Access route schematic.
- Replace the thick green/plum group outlines with thin open bracket rules, not enclosing rounded rectangles. Use consistent medium-weight text for the two group headings, not ultra-heavy capitals.
- Remove the capsule border around "Context-specific equity assessment". Keep it as dark typeset text with the two clean headless connections terminating beside the text, not running through it.
- In the lower evidence strip, REMOVE the park clipart and crossed tools altogether. Keep the two comparison statements as a refined two-column typographic comparison on white, aligned and readable, divided by a short fine rule.
- Keep the observed COVID sentence and all labels exactly correct and legible. Reduce the title weight slightly; keep the title wording.
The central contribution should remain the combination of objective provision and resident experience, grounded by the western peri-urban comparison. No invented line charts or numerical values. Do not fill freed space with decoration. Use the saved space for compact, comfortable alignment, preserving readable label sizes.
```

### Amenities and creativity

Final asset: `images/publications/amenity-creativity-spatial-context-reviewed.png`.

Initial prompt:

```text
Generate a substantially better economic-geography graphical abstract from the supplied ORIGINAL theoretical-framework page (Figure 1) for Wu et al., Cities 120 (2022) 103421. Reference is scientific content, not a layout to copy. 1536x1024 landscape, opaque white.

The previous simplified poster merely defined a count versus a share and LOST THE RESEARCH CONTRIBUTION. Restore it: urban amenities relate differently to firm agglomeration and local creativity; multiple spatial relationships coexist; their relevance depends on the outcome and position within the metropolis. In the Shanghai study, amenity associations with general firm agglomeration weaken away from the CBD, whereas associations with creativity persist in suburbs. Observational associations, NOT causality. Do not invent effect sizes, cutoff distances, a zero effect, or empirical maps.

Visual language: crisp precise economic-geography analytical graphics with rich but restrained charcoal, muted teal and raspberry. No watercolor, hand-drawn style, 3D buildings, decorative scenes, plots, graded heatmaps, percentages, dense coordinate grids, numerical axes, proportional line widths, rounded cards or stock clipart. Do not make the graphic all text or boxes.

Title: "Amenities do not attract firms and creativity in the same way"

Upper 35% contains three well-crafted sparse, small spatial schematics, one row:
"Co-location": several small dark firm squares intermingled with teal amenity circles.
"Accessibility": a few fine nondirectional connections from dark squares to teal circles.
"Amenity clusters": a compact teal circle group beside dark squares.
Keep schematic shapes unambiguous and distinguish squares from circles.
Small shared legend: dark square "Firm", teal circle "Amenity".
Centered beneath this row: "Coexisting spatial relationships"

The LOWER HALF is the main finding: TWO clear parallel horizontal comparison lanes, within a common geography from "CBD" on the left to "Suburbs" on the right. Put these two geography headings over the lanes, not on a statistical axis, and label the whole area "QUALITATIVE SPATIAL CONTRAST".
First lane: "Firm agglomeration" in charcoal at left, a small repeated dark-square motif near it, and to the right the decisive annotation "Amenity association weakens away from the CBD". A fine neutral line connects the two place labels only, with no fading, variation in width, or plotted heights. No arrow implying causation.
Second lane: "Local creativity" in raspberry at left, a small mixed dark/raspberry square motif, and the decisive annotation "Amenity association persists into suburbs". Same fine line geometry, length and thickness. No inferred numeric range.
The lane annotations are the primary contrast, use emphatic but compact typography and plenty of clarity.

Bottom concise theoretical takeaway: "Agglomeration and creativity need different spatial explanations"
Footer: "Shanghai producer services | Conceptual synthesis of observational findings"
Use no other words. Do not turn these qualitative associations into fictitious quantitative curves or flow maps. The urban geography is conceptual and unscaled. Main finding must remain readable at 700px width.
```

Targeted correction:

```text
Edit this graphical abstract with three precise corrections; preserve all other scientific information, the three relationship schematics, legend, two qualitative lanes, outcome labels, main finding annotations, and white background.
1. Remove the entire gray city skyline and bridge. No architecture or other replacement decoration. Tighten the resulting layout by bringing the takeaway and footer upward, producing a more compact landscape figure without a large empty gap.
2. Replace ONLY the top title with "Amenity associations differ for agglomeration and creativity". Use a moderate-size scholarly sans-serif, not a gigantic promotional headline.
3. Remove the pale filled rounded boxes behind the two outcome labels; keep the labels aligned on white, with charcoal and raspberry accent text. Remove the pale oval backgrounds around the top three diagrams while preserving all their nodes and connections.
Keep the two CBD-to-suburb lines thin and uniform. Do not turn them into curves, arrows, gradients, varying-width flows or measured values. Retain "QUALITATIVE SPATIAL CONTRAST". All annotations remain verbatim. Preserve crisp readability, fully opaque white, no watercolor/hand drawing, no added content. The result must feel like a precise journal figure rather than an infographic template.
```

## Output acceptance

- Industry: retained three regional resource clusters, a local amenity configuration,
  both mechanisms, nested scales and the shared urban context. Removed the
  fictional city/industrial-park rendering and unnecessary boxed styling.
- Park equity: removed duplicate road grids, added the combined assessment
  framework and the western peri-urban evidence. A correction subordinated the
  initially oversized clipart and removed the lower decorative icons.
- Creativity: restored amenity associations and metropolitan context, retained the
  three spatial relationships, and avoided fake effect curves. A correction
  removed the unrequested skyline and shaded containers and changed the headline
  to association wording.
- Older images remain in the repository. Only these three shared bilingual
  references change. No pending publication image or summary is newly approved.

## Website checks

Production build, the bilingual site validator and all six language-routing tests
pass. Both archives retain 33 records and nine approved images; default image
payload is 517,012 bytes, below the unchanged 1 MB budget. Browser inspection
checked the industry diagram on desktop and park equity at a 390-pixel viewport.
The mobile page has no horizontal overflow. Fine annotations remain too small
for comfortable thumbnail reading; they are available through the full-size
figure link, not described as fully readable at thumbnail size.

The creativity image links to its Chinese internal detail page; switching to
English preserves the corresponding article and new figure. The full-size link
targets the large WebP. Temporary viewport overrides and preview tabs were
cleared, and the local preview server was stopped after checks.
