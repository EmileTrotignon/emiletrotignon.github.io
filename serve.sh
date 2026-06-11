#!/bin/sh
cd _build/default/site && python3 -c "
import http.server, os
class H(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if not os.path.exists(self.translate_path(self.path)):
            self.path += '.html'
        super().do_GET()
http.server.HTTPServer(('', 4000), H).serve_forever()
"
