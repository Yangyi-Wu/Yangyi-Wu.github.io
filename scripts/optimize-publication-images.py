"""Create responsive WebP assets without changing the reviewed illustration content."""
import json
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
manifest = {}
for path in (ROOT / "images/publications").glob("*-reviewed.png"):
    source = "/" + path.relative_to(ROOT).as_posix()
    with Image.open(path) as original:
        original.load()
        entry = {"width": original.width, "height": original.height}
        for size, width in [("small", 480), ("medium", 960), ("large", original.width)]:
            resized = original.copy()
            resized.thumbnail((width, round(width * original.height / original.width)), Image.Resampling.LANCZOS)
            output = path.with_name(path.stem + "-" + size + ".webp")
            resized.save(output, "WEBP", quality=88, method=6)
            entry[size] = "/" + output.relative_to(ROOT).as_posix()
        manifest[source] = entry
(ROOT / "_data/publication_images.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
print(f"Optimized {len(manifest)} reviewed illustrations.")
