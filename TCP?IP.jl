using Sockets

# Server

# Listen for incoming connections on port 8000
server = listen(8000)

# Accept a new connection from a client
client = accept(server)

# Read a message from the client
message = readstring(client)
println("Received message from client: $(message)")

# Send a response to the client
write(client, "Hello from the server!")

# Close the connection to the client
close(client)

# Client

# Connect to the server
client = connect(IPv4(127,0,0,1), 8000)

# Send a message to the server
write(client, "Hello from the client!")

# Read a response from the server
response = readstring(client)
println("Received response from server: $(response)")

# Close the connection to the server
close(client)
