using Sockets

# Connect to the server
client = connect(IPv4(127,0,0,1), 8000)

# Send multiple messages to the server
for i in 1:5
    write(client, "Hello from the client! This is message $(i).")
    # Read a response from the server
    response = readstring(client)
    println("Received response from server: $(response)")
end

# Perform other operations
# ...

# Close the connection to the server
close(client)
