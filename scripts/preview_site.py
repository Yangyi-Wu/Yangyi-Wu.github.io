"""Preview built Jekyll pages with GitHub Pages' extensionless HTML routes."""
import argparse
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlsplit, urlunsplit


class PagesHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        url = urlsplit(self.path)
        target = Path(self.translate_path(url.path))
        if not target.exists() and not target.suffix and target.with_suffix(".html").is_file():
            self.path = urlunsplit((url.scheme, url.netloc, url.path + ".html", url.query, url.fragment))
        super().do_GET()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--directory", default="_site-preview")
    parser.add_argument("--port", type=int, default=4000)
    args = parser.parse_args()
    handler = partial(PagesHandler, directory=args.directory)
    server = ThreadingHTTPServer(("127.0.0.1", args.port), handler)
    print(f"Preview: http://localhost:{args.port}/", flush=True)
    server.serve_forever()
