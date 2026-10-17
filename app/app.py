import os
from http.server import HTTPServer, BaseHTTPRequestHandler

NAME = os.environ.get("STUDENT_NAME", "Abdualim")
SURNAME = os.environ.get("STUDENT_SURNAME", "Kozhanov")
GROUP = os.environ.get("STUDENT_GROUP", "IT2-2313")
STUDENT_ID = os.environ.get("STUDENT_ID", "37019")
PORT = 5000

INFO = f"""================================
DevOps Student Application
================================
Name: {NAME}
Surname: {SURNAME}
Group: {GROUP}
Student ID: {STUDENT_ID}
Application is running successfully!"""


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(INFO.encode("utf-8"))


print(INFO, flush=True)
print(f"Server is listening on port {PORT}", flush=True)
HTTPServer(("0.0.0.0", PORT), Handler).serve_forever()
