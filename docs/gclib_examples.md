# Gclib.jl Helper Functions (gclibo equivalent)

This document shows examples of using the Julia equivalents of the gclibo helper functions.

## Basic Connection and Information

```julia
using Gclib

# Get library version
ver = version()
println("Library version: $ver")

# Get available addresses  
addrs = addresses()
println("Available controllers: $addrs")

# Get IP requests
requests = ip_requests()
println("Controllers requesting IP: $requests")

# Connect to a controller
try
    g = GCon("192.168.1.100")  # Replace with actual controller IP
    
    # Get controller info
    info_str = info(g)
    println("Controller info: $info_str")
    
    # Set timeout
    timeout(g, 5000)  # 5 second timeout
    
    # Send basic commands
    cmd(g, "AB")  # Abort motion
    
    # Get position as integer
    pos = cmd_i(g, "TP")
    println("Position: $pos")
    
    # Get position as float
    pos_float = cmd_d(g, "TP") 
    println("Position (float): $pos_float")
    
    # Get trimmed response
    response = cmd_t(g, "MG \"Hello World\"")
    println("Response: $response")
    
    # Wait for motion to complete
    motion_complete(g, "ABCD")  # Wait for axes A,B,C,D
    
    # Set data record rate
    record_rate(g, 100.0)  # 100ms period
    
    # Program operations
    program_download_file(g, "my_program.dmc", "")
    program_upload_file(g, "uploaded_program.dmc")
    
    close(g)
catch e
    println("Connection failed: $e")
end
```

## Network Functions

```julia
# Assign IP address to MAC address
try
    assign("192.168.1.100", "00:50:4C:00:12:34")
catch e
    println("Assignment failed: $e")
end
```

## Server Functions (requires gcaps)

```julia
# List available servers
try
    servers = list_servers()
    println("Available servers: $servers")
    
    # Get server status
    status = server_status()
    println("Server status: $status")
    
    # Publish server
    publish_server("MyServer", true, true)  # publish and save
    
    # Set active server
    set_server("RemoteServer")
    
    # Get remote connections
    connections = remote_connections()
    println("Remote connections: $connections")
catch e
    println("Server operation failed: $e")
end
```

## Error Handling

```julia
# Convert error codes to strings
error_msg = gerror(-1)  # Get error message for code -1
println("Error: $error_msg")
```

## File Operations

```julia
try
    g = GCon("COM1")  # Serial connection example
    
    # Array operations (simplified implementations)
    array_download_file(g, "arrays.csv")
    array_upload_file(g, "exported_arrays.csv", "")
    
    close(g)
catch e
    println("File operation failed: $e")
end
```

## Notes

1. All functions that take string arguments are properly protected with `GC.@preserve` to prevent garbage collection issues.

2. Error handling uses the same exception types as the base gclib functions.

3. Server functions require gcaps to be available and running.

4. The `cmd_t` function automatically trims trailing colons, newlines, and carriage returns from responses.

5. Motion functions use the `_BG` operand to check for motion completion.

6. The `record_rate` function automatically adjusts for different controller types and their minimum data record rates.
