# Web-readable research figures, 2026-10-01

## Delivery

Mode: built-in image-generation tool. No API key or CLI fallback was used. The tool does not expose a selectable backend model identifier.

- Park equity: `images/publications/park-equity-experience-v5-reviewed.png`
- Urban form: `images/publications/urban-form-power-capital-2026-v3-reviewed.png`

Both figures replace the previous website illustrations on their bilingual detail pages and homepage highlights. Original figures and previous revisions remain available in the repository. Publication lists stay text-only; the dissertation stays image-free.

## Evidence and review

Park equity retains the two regional comparisons from Wu et al. (2025), publisher abstract and discussion/conclusions, pp. 1, 10-11. Southern peri-urban objective access is poorer despite more optimistic perceptions. Western access is similar to the center, with greater infrastructure needs and quality-sensitive use during COVID-19. Illustrated plans are not empirical maps.

Urban form retains the mutually constitutive relationship between regionalization and the triple process in Wang, Wu & Zhang (2026), Fig. 1 and sections 2.2-3.2, 6.1 and 7. The rescaling of power and capital changes local-government strategies; cooperation and competition coexist. Greater connectivity and patch density are associated outcomes, not experimental causal effects. The network is conceptual, not measured land cover. Investment moderation/mediation findings remain in the article text, rather than being squeezed into the figure.

The final urban-form edit removes unnecessary small subtitles. Final wording and direction of connectors were visually checked; no national map is used. WebP derivatives preserve the image content.

## Park prompt

```text
Use case: scientific-educational.
Asset type: final square research graphical abstract for an academic urban-planning website, legible when displayed at 350 CSS pixels wide.
Input image 1 is the existing scientifically checked figure and an evidence reference, not a layout to preserve.
Redesign as a refined journal editorial figure, exactly square, white background, sober dark charcoal typography, forest green and muted vermilion accents. Use elegant small architectural-plan illustrations with fine linework and restrained watercolor washes only for the two illustrative park environments. No map outlines, no empirical geography, no invented quantitative chart. Do not make a poster with oversized slogans or a dense dashboard.
The contribution is that objective provision and resident experience can diverge in two different peri-urban contexts. Depict two vertically stacked, generously spaced comparisons. Each comparison should contain a small park-plan vignette occupying no more than a quarter of its area, with the contrast expressed in large legible text.
Heading: "Park equity through experience"
First comparison:
"Southern peri-urban"
"Poorer measured access"
"More optimistic perceptions"
Connect the last two labels with a thin non-directional line indicating comparison, not a causal arrow.
Second comparison:
"Western peri-urban"
"Access similar to the center"
"Greater infrastructure needs"
"Quality-sensitive use"
Again use comparison rather than causal arrows. Give the two findings equally clear organization; the last line belongs to the western case.
Small footer only: "Salt Lake City · Wu et al. (2025)"
All essential lettering should be at least 42 pixels in a 1024-pixel square, heading around 60, footer can be 24. Text only the exact specified labels. No duplicate take-home slogan, no disclaimer text, no gradients, no shadowed letters, no rounded cards, no crowded compartments. Accurate spelling, crisp professional type, spacious but no giant empty space. Preserve the reference's scientific comparisons; do not imply western measured access is worse than the center, nor that southern objective access is better.
```

## Urban-form prompt

```text
Use case: scientific-educational.
Asset type: square graphical abstract for a contemporary urban and economic geography research website.
Reference image 1 is the current evidence-checked graphical abstract. Preserve its central theory and empirical finding but redesign to be legible at 350 CSS pixels wide. This is a focused summary of the central contribution, not a comprehensive reproduction.
White background. Crisp large modern sans-serif type. Dark charcoal, muted teal, small brick-red accents. Precise geographical network drawing, no watercolor, no shaded boxes, no decorative card panels, no national or regional outlines, no empirical maps, no invented estimates.
Three clear vertical bands:
1. An open, compact relationship diagram with "Regionalization" on the left and the stacked labels "Decentralization", "Marketization", "Globalization" on the right; a balanced bidirectional connector between them. They are mutually constitutive, NOT a temporal sequence.
2. Below them, thin conceptual connectors lead to the large central label "Rescaling power & capital" (two lines). Below this label show "Local-government strategies" and the phrase "Cooperation + competition".
3. At the bottom, a small precise abstract network of several compact urban patch clusters with bridges BETWEEN spatially separated clusters. It should make it visually clear that a connected network can still consist of fragmented patches. No recognizable landmass, no before/after comparison. Beside or underneath this modest diagram, use two equally weighted large labels "Greater connectivity" and "Higher patch density", joined with a plus sign, not a causal arrow.
Title at top in two short lines: "Regionalization and urban form"
Small footer: "Greater Bay Area · Wang, Wu & Zhang (2026)"
These are the ONLY text labels. Keep all essential labels at least 42 px at 1024 square resolution; heading 58, footer 24. Use space efficiently, balanced visual hierarchy and good margins. The original source gives association, not an experimental causal effect; empirical labels MUST NOT have a directional arrow between them. The fine lines within the top theory diagram express conceptual relationships. Omit the secondary investment-pathway analysis from this focused image; it remains explained in the adjacent website text. No disclaimers or redundant slogans.
```

## Urban-form refinement prompt

```text
Edit this square academic diagram with only the following precise changes. Keep the overall layout, square proportions, large headings, all main diagram relationships, colors, and lower conceptual network.
Remove these four small explanatory text blocks completely:
"Rescaling state power and capital", "Empowering local governments", "Land-market incentives", "External capital & linkages".
In the space freed, enlarge the three names "Decentralization", "Marketization", "Globalization" and keep them in a compact vertically spaced stack. Keep "Regionalization" opposite this stack with a bidirectional connector. Keep the connector label "Mutually constitutive" but give it enough space and crisp readable type.
Everything else is unchanged, including the central power/capital mechanism, the cooperation + competition line, the two bottom outcomes and footer. Make all text flat and crisp with no shadow or embossing. White background. Do not add any text or alter scientific meaning.
```

