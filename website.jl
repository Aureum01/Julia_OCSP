using HTTP

# Create a server that listens on localhost:8000
server = HTTP.HTTPServer(8000)

# Define a request handler that serves HTML files from the "public" directory
function handle_request(req::HTTP.Request)
    # Get the requested path from the URL
    path = req.URL.path

    # Set the default path to "index.html"
    if path == "/"
        path = "/index.html"
    end

    # Try to open the requested file from the "public" directory
    try
        file = open("public$(path)")
        # Set the response status to 200 OK
        res = HTTP.Response(200)
        # Set the response body to the contents of the file
        res.body = readstring(file)
        # Set the content type to HTML
        res["Content-Type"] = "text/html"
    catch
        # If the file couldn't be opened, set the response status to 404 Not Found
        res = HTTP.Response(404)
        # Set the response body to an error message
        res.body = "404: Not Found"
    end

    return res
end

# Set the request handler for the server
server.handle_request(handle_request)

# Start the server
HTTP.start(server)
