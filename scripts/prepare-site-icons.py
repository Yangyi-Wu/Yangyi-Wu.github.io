"""Rasterize the rectilinear SVG brand mark for legacy browsers and bookmarks."""

from pathlib import Path
from xml.etree import ElementTree

from PIL import Image, ImageDraw


root = Path(__file__).resolve().parents[1] / "images"
svg = ElementTree.parse(root / "favicon.svg").getroot()
scale = 16
image = Image.new("RGB", (64 * scale, 64 * scale))
draw = ImageDraw.Draw(image)
for element in svg:
    kind = element.tag.rsplit("}", 1)[-1]
    if kind == "title":
        continue
    if kind == "rect":
        x, y = (int(element.get(axis, 0)) * scale for axis in ("x", "y"))
        w, h = (int(element.get(axis)) * scale for axis in ("width", "height"))
        draw.rectangle((x, y, x + w - 1, y + h - 1), fill=element.get("fill"))
    elif kind == "polygon":
        points = [tuple(int(n) * scale for n in pair.split(",")) for pair in element.get("points").split()]
        draw.polygon(points, fill=element.get("fill"))
    else:
        raise ValueError(f"Unsupported SVG element: {kind}")

for size in (32, 180, 192, 512):
    name = "apple-touch-icon" if size == 180 else "favicon"
    image.resize((size, size), Image.Resampling.LANCZOS).save(root / f"{name}-{size}x{size}.png")
image.save(root / "favicon.ico", sizes=[(16, 16), (32, 32), (48, 48)])
print("Generated PNG and ICO variants from favicon.svg")
