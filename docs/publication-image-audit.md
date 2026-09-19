# Publication image audit

Review date: 2026-09-19. Review is incremental; pending is not approval.

## Acceptance criteria

- Explain a source-supported conceptual contribution, not generic subject matter.
- Distinguish proposed frameworks and observed associations from causal evidence.
- Never invent geographic boundaries, empirical locations, scores or curves.
- Use an original source figure when actual geography is needed. No national map
  of China in generated artwork.
- Keep the main comparison legible at archive width; detail belongs on the
  article page. Use the same artwork for both languages with localized alt text.
- Only set `visual_reviewed` after source and generated-output checks.

## Decisions

| Paper | Existing asset(s) | Decision | Reason and source |
| --- | --- | --- | --- |
| Park use in peri-urban areas, LUP 2025 | `park-use-equity-covid-peri-urban-thumbnail.png`; `park-use-equity-covid-peri-urban-journal-abstract.png` | Replaced | Poster includes unsupported percentage time series and a regional access ranking inconsistent with the abstract. Thumbnail crowds a map and a generic framework. Source: supplied `Wu25LAUP_Park equity.pdf`, p. 1 and sections 4-5. The center and west have similar objective access but different perceptions; the south also shows an objective/subjective mismatch. |
| Amenities and knowledge-intensive industry, Applied Geography 2025 | `urban-amenities-knowledge-intensive-industry-wuhan-thumbnail.png`; `urban-amenities-knowledge-intensive-industry-wuhan-journal-abstract.png` | Replaced | Poster redraws geographic clusters and assigns unverified functions to rings. Thumbnail overstates causal direction and is crowded. Source: supplied `Teng25JAPG_Amenity and KI.pdf`, pp. 1, 3 and 13. Preserve the distinction between metropolitan sectoral advantage and local place-based attractiveness. |
| Neighborhood amenities and housing prices, ASAP 2025 | `neighborhood-amenity-housing-prices-urban-china-thumbnail.png`; `neighborhood-amenity-housing-prices-urban-china-journal-abstract.png` | Replaced | Thumbnail contains an unsupported SHAP-like service ranking and directions of effects. Full poster adds an unverified 15-minute travel claim, redrawn geography, and uniform prescriptions for broad zones. Both overwhelm the four-dimensional framework. Source: supplied `Qu2025ASAP_Amenity and HP.pdf`, pp. 1-2 and 22. |
| Shanghai institutions and housing markets, JUA 2025 | `institutions-residential-markets-shanghai-thumbnail.png`; `institutions-residential-markets-shanghai-journal-abstract.png` | Replaced | Full poster prioritizes jobs for buyers, contrary to the abstract's relative buyer/service and renter/employment emphases. It adds unsupported price curves and a pseudo-map. Thumbnail presents an overly categorical causal sequence. Source: supplied Wei24JUA PDF, PDF pp. 2 and 18. |
| Polycentric development, CGS 2025 | `polycentric-urban-development-china-thumbnail.png`; `polycentric-urban-development-china-journal-abstract.png` | Replaced | Thumbnail is crowded and its definite commuting/congestion consequences flatten context-dependent review findings. Full poster gives a conceptual urban form an empirical cartographic appearance. Source: supplied Wei2025CGS PDF, pp. 1-2 and 9, distinguishing morphological and functional centers, scales and institutions. |
| Amenities and creativity, Cities 2022 | `amenities-local-creativity-shanghai-thumbnail.png` | Replaced | Title claims amenities produce creativity; simulated curves and a pseudo-Shanghai map suggest more causal and spatial precision than the observational study supports. Source: supplied Wu22Cities PDF, pp. 1 and 14. |

The previously approved housing-connectivity, agglomeration-scales and
park-matching illustrations remain enabled. Other illustrations remain pending;
absence from this table does not mean they have passed this review.

## Generation record

Use the built-in image-generation tool, one call per asset. Exact prompts and
output checks are recorded below when each replacement is completed. Responsive
WebP conversion is mechanical; it must not change the scientific content.

### Completed replacements

Exact prompts: `docs/publication-image-prompts-2026-09.md`.

- `park-experienced-equity-reviewed.png`: passed source/text check. Matched
  illustrative access routes contrast experienced conditions; no real distances,
  map or invented visitation series. First generation had a transparent dark
  background and was rejected; an engine edit corrected background and contrast.
- `amenity-industry-scales-reviewed.png`: passed source/text check. Zoom linkage
  represents nested scales rather than causal proof. First generation incorrectly
  represented urban sectors with industrial-sector symbols; an engine edit replaced
  those with urban building groups. The drawing is not Wuhan geography or a map of
  observed clusters.
- `amenity-housing-dimensions-reviewed.png`: passed source/text check. Separates
  accessibility and activity dimensions; schematic arrangements preserve the same
  four colored nodes. No fabricated coefficients, rankings, scores or curves. The
  two arrangements are illustrative, not an empirical comparison or preference.

The three replacements are shared by the English and Chinese archive/detail
pages. Each has localized alt text; detail-page captions explicitly identify the
image as conceptual. Archive images remain below the bibliographic entry.

### Second reviewed batch

- `housing-tenure-context-reviewed.png`: correctly pairs buyers with relatively
  greater service-amenity emphasis and renters with employment emphasis. Identical
  housing illustrations avoid equating tenure with stereotyped living conditions.
- `polycentric-form-function-reviewed.png`: five nodes appear in both panels,
  distinguishing spatial concentrations from functional dependence. An engine
  correction resolved the initial four-versus-five-node mismatch. No geography
  or measured flows are implied; the source is explicitly a literature review.
- `amenity-creativity-distinction-reviewed.png`: distinct relationship schematics
  and outcome labels replace pseudo-empirical curves and the old causal headline.

Status after two batches: nine approved illustrations and nine source-checked
bilingual summaries; 24 records still have no approved illustration or summary.

## Earlier watercolor pass (superseded)

After the scientific review, the user suggested planning hand-sketch/watercolor
as a possible style. The implementation applied this too broadly. That pass used
pen-and-wash architectural scenes and
restrained watercolor for abstract schematics. All labels, topology, diagram
counts and scientific distinctions must survive the style transfer. Actual maps
or statistical figures must not be freely repainted. White backgrounds and crisp
typeset text are required for website readability. Retain the flat originals and
save accepted style variants with `-watercolor-reviewed.png` filenames.

All six new conceptual replacements passed a subsequent watercolor review:

- Park equity: matched paths, region labels and all comparison wording retained.
- Industry scales: three urban-sector anchors, infrastructure links and zoom
  connection retained; the local scene remains an illustrative neighborhood.
- Amenity dimensions: six identical quantity symbols, the four mix categories and
  both four-node arrangements retained. No new numeric rating introduced.
- Housing tenure: identical housing illustrations and the correct relative
  buyer/service and renter/employment emphases retained.
- Polycentricity: five nodes in each panel and the functional-network topology
  retained. These are not observed cities or mapped flows.
- Creativity: square/circle legend, all three relationship configurations and
  observed outcome distinctions retained.

The website initially referenced these six `-watercolor-reviewed.png` variants
via responsive WebP assets. Both these and the flat originals remain available
in the repository, but the clarified policy below supersedes the style choice.
Exact successful style-transfer prompts are in
`docs/publication-watercolor-prompts-2026-09.md`. Two stalled edit attempts were
terminated without an accepted asset and successfully retried with the built-in
image engine; no CLI/API fallback was used.

## Discipline-specific correction

The user clarified that only design/planning proposal drawings should use a
hand-drawn style. A park-equity assessment is not a park-design proposal, and a
housing-price analysis is not an architectural design. Match the graphic's role
and disciplinary methods rather than applying one aesthetic to all publications.

The first batch replaces three geography graphics:

- `polycentric-cartographic-reviewed.png`: point concentrations versus a
  five-center network. This is a hypothetical spatial schematic, not a real map.
- `amenity-industry-spatial-model-reviewed.png`: an idealized metropolitan
  pattern and local-scale computational model. The title/footer do not identify
  these invented geometries as observed Wuhan locations.
- `amenity-creativity-point-patterns-reviewed.png`: matched point configurations
  distinguish firm concentration from the share of creative firms, followed by
  three relationship schematics. The source's creative-firm ratio is confirmed
  in the supplied PDF, pp. 10 and 14. Illustrative counts are not reported data.

All three remove watercolor/sketch rendering. Exact prompts, visual policy and
generation checks are in `docs/publication-discipline-prompts-2026-09.md`.
The second batch completes the other three replacements:

- `park-equity-assessment-reviewed.png`: an objective/experienced comparison
  using matched schematic access networks, not landscape design scenes. Equal
  access is not presented as equal quality or equal service experience.
- `housing-tenure-institutional-reviewed.png`: a typographic institutional
  framework, with both markets connected to both services and jobs. Relative
  emphasis is stated explicitly; there is no absolute preference split.
- `amenity-housing-analysis-reviewed.png`: crisp digital configuration diagrams
  group quantity/quality under accessibility and mix/arrangement under activity.
  Neither illustrative arrangement is presented as a universal optimum.

All six new files replace watercolor references in the shared bilingual metadata.
No other illustration or summary has been newly approved: the site still has
nine approved illustrations and nine reviewed summaries, with 24 pending.

## Earlier website verification

Production Jekyll build and the site validator pass: 33 entries, 66 bilingual
detail routes, nine enabled images and 824,816 bytes of default archive images
(below the existing 1 MB budget). All six language-routing tests pass. Browser
checks cover desktop park rendering, 390-pixel mobile morphology/function
rendering without horizontal overflow, image-to-internal-detail navigation and
English-to-Chinese detail switching with the same watercolor asset.

## Discipline-specific verification

After the six replacements, the production build and site validator pass:
33 entries, 66 bilingual detail routes, nine enabled images and 585,082 bytes of
default archive images, below the unchanged 1 MB budget. All six language tests
pass. Browser QA confirms the new morphology/function figure loads at desktop
width, the tenure figure loads at 390-pixel viewport width without horizontal
overflow, image clicks enter the Chinese internal detail route, and switching
to English retains the same new image and corresponding article. Full-size image
links remain available on detail pages. Temporary viewport overrides are reset.
