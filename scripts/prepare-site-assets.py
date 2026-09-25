"""Prepare the licensed city photograph and a self-hosted site font."""

import argparse
import shutil
from pathlib import Path

from fontTools import subset
from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont
from PIL import Image


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    photos = root / "images" / "site"
    fonts = root / "assets" / "webfonts" / "utsi"
    photos.mkdir(parents=True, exist_ok=True)
    fonts.mkdir(parents=True, exist_ok=True)

    image = Image.open(args.source / "wuhan-yuejiazui.jpg").convert("RGB")
    for width in (960, 1920):
        resized = image.copy()
        resized.thumbnail((width, width))
        destination = photos / f"wuhan-yuejiazui-{width}.webp"
        resized.save(destination, "WEBP", quality=80, method=6)
        print(destination.name, resized.size, destination.stat().st_size)

    characters = set(chr(code) for code in range(32, 591))
    for folder in ("_data", "_pages", "_includes", "_layouts", "_publications", "_plugins"):
        for source in (root / folder).rglob("*"):
            if source.suffix in (".yml", ".html", ".md", ".rb"):
                characters.update(source.read_text(encoding="utf-8"))
    font = TTFont(args.source / "NotoSansSC.ttf")
    font = instantiateVariableFont(font, {"wght": (400, 400, 700)}, inplace=True)
    options = subset.Options()
    options.flavor = "woff2"
    options.name_IDs = [0, 1, 2, 3, 4, 5, 6, 13, 14]
    subsetter = subset.Subsetter(options=options)
    subsetter.populate(text="".join(sorted(characters)))
    subsetter.subset(font)
    font.flavor = "woff2"
    destination = fonts / "utsi-sans.woff2"
    font.save(destination)
    shutil.copyfile(args.source / "OFL.txt", fonts / "OFL.txt")
    print(destination.name, len(characters), "characters", destination.stat().st_size)


if __name__ == "__main__":
    main()
