"""Create responsive WebP assets without changing the reviewed illustration content."""
import json
import sys
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
image_directory = ROOT / "images/publications"
manifest_path = ROOT / "_data/publication_images.json"
paths = [Path(arg).resolve() for arg in sys.argv[1:]] if len(sys.argv) > 1 else list(image_directory.glob("*-reviewed.png"))
manifest = json.loads(manifest_path.read_text(encoding="utf-8")) if len(sys.argv) > 1 else {}
for path in paths:
    if path.parent != image_directory or not path.name.endswith("-reviewed.png"):
        raise ValueError(f"Expected a reviewed PNG in {image_directory}: {path}")
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
manifest_path.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
print(f"Optimized {len(paths)} reviewed illustrations; manifest contains {len(manifest)} entries.")
