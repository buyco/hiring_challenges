#!/bin/bash
import json
import datetime
from http.server import BaseHTTPRequestHandler, HTTPServer
from processApp import *


SERVERPORT = 8000


class RequestHandler(BaseHTTPRequestHandler):
    # Will catch the web requests and will call the specified functions
    def do_GET(self):
        # Get method operations (For the moment we will deactivate this part! It's not secure)
        request_path = self.path

        self.send_response(400)
        self.end_headers()
        json_string = json.dumps({"message" : "You should use the POST method!"}) + "\n"
        self.wfile.write(json_string.encode())
        return

    def do_POST(self):
        # POST operations
        request_path = self.path
        content_len = int(self.headers.get('Content-Length'))
        post_body = self.rfile.read(content_len)
        print(post_body.decode("UTF-8"))
        request_headers = self.headers
        response_code = self.save_models(post_body)
        self.send_response(response_code)
        self.end_headers()
        # Will return the below message
        jsondumps = json.dumps({'status': 'success'}) + "\n"
        self.wfile.write(jsondumps.encode())
        return

    def save_models(self, data):
        # Will save a part of the entry data in db and other part in background operation 
        print('In save models -> New data detected')
        try:
            jsondata = json.loads(data)
            # record_data.delay(jsondata)
            record_data(jsondata)
            return 200
        except Exception as e:
            print(e.args)
            return 500

    do_PUT = do_POST
    do_DELETE = do_GET


def run(server_class=HTTPServer, handler_class=RequestHandler):
    # The server will run from the specified port for ever
    server_address = ('', SERVERPORT)
    httpd = server_class(server_address, handler_class)
    print(f"Server running on: {server_address}")
    httpd.serve_forever()


if __name__ == "__main__":
    # The beginning of the code
    run()
