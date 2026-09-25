"""Export intact figures from the supplied papers for the editorial homepage."""

import argparse
from pathlib import Path

from pypdf import PdfReader


FIGURES = (
    ("Wu25LAUP_Park equity.pdf", 2, "X1.png", "park-equity-study-area"),
    ("Teng25JAPG_Amenity and KI.pdf", 3, "X2.jpg", "amenity-industry-framework"),
)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path, help="Directory containing the source PDFs")
    args = parser.parse_args()
    output = Path(__file__).resolve().parents[1] / "images" / "research-originals"
    output.mkdir(parents=True, exist_ok=True)
    for filename, page, image_name, stem in FIGURES:
        page_images = PdfReader(args.source / filename).pages[page].images
        image = next(item.image for item in page_images if item.name == image_name).convert("RGB")
        for width in (640, 1280):
            copy = image.copy()
            copy.thumbnail((width, 2000))
            destination = output / f"{stem}-{width}.webp"
            copy.save(destination, "WEBP", quality=92, method=6)
            print(f"{destination.name}: {copy.size}, {destination.stat().st_size} bytes")


if __name__ == "__main__":
    main()
