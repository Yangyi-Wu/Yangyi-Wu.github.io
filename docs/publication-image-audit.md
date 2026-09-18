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

Status after this batch: six reviewed illustrations displayed; 27 records still
have no approved illustration. Seven bilingual summaries are source-checked.
