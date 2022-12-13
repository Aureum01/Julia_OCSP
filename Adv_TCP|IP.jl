using Sockets

# Server

# Listen for incoming connections on port 8000
server = listen(8000)

# Create an array to store the connections to all clients
clients = []

# Accept new connections from clients in a loop
while true
    client = accept(server)
    # Store the connection to the client
    push!(clients, client)
    # Start a new task to handle communication with the client
    @async begin
        while true
            # Read a message from the client
            message = readstring(client)
            # If the client has closed the connection, break out of the loop
            if message == nothing
                break
            end
            # Print the message received from the client
            println("Received message from client: $(message)")
            # Send a response to the client
            write(client, "Hello from the server!")
        end
        # Remove the client from the list of clients
        deleteat!(clients, findfirst(clients, client))
    end
end

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
