using Base.Libc

function keylogger()
    # Create a buffer to hold the keystroke data
    buffer = Vector{UInt8}(undef, 32)

    # Loop forever
    while true
        # Use the `read` function from Libc to read keystrokes from the standard input
        n = ccall((:read, "libc"), Int32, (Int32, Ptr{UInt8}, UInt64), 0, buffer, 32)

        # If any keystrokes were read, print them to the standard output
        if n > 0
            println(String(buffer[1:n]))
        end
    end
end

# Start the keylogger
keylogger()
