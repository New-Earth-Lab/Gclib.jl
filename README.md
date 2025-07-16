# Gclib.jl

A Julia wrapper for the Galil Motion Control gclib library, providing both low-level C bindings and high-level helper functions equivalent to the gclibo library.

## Overview

Gclib.jl enables Julia programs to communicate with Galil motion controllers over Ethernet, serial, or USB connections. It provides:

- **Low-level bindings** (`LibGclib`) - Direct access to all gclib C functions
- **High-level interface** (`Gclib`) - Julia-idiomatic helper functions equivalent to gclibo
- **Error handling** - Julia exceptions for gclib error codes

## Quick Start

```julia
using Gclib

# Connect to a controller
g = GCon("192.168.1.100")  # Replace with your controller's IP

try
    # Send commands and get responses
    cmd(g, "AB")  # Abort all motion
    
    # Get position as different types using multiple dispatch
    pos_str = cmd(String, g, "TP")      # Get as string
    pos_int = cmd(Int, g, "TP")         # Get as integer  
    pos_float = cmd(Float64, g, "TP")   # Get as float
    
    # Wait for motion to complete
    motion_complete(g, "ABCD")
    
    # Upload/download programs
    program_download_file(g, "my_program.dmc")
    program_upload_file(g, "backup.dmc")
    
finally
    close(g)
end
```

## Features

### Connection Management
- **GCon**: Main connection object with automatic cleanup
- **Multiple protocols**: Ethernet, serial, USB connections
- **Timeout control**: Configurable communication timeouts

### Command Interface
Modern Julia dispatch-based command interface:
```julia
# Multiple dispatch based on return type
result = cmd(String, g, "MG TIME")     # Returns trimmed string
count = cmd(Int, g, "PC 1")            # Returns integer
voltage = cmd(Float64, g, "MG @AN[1]") # Returns float64

# Fire-and-forget commands
cmd(g, "JG 1000")  # Send command without waiting for response
```

### Legacy Compatibility
```julia
# Traditional gclibo-style functions still available
response = cmd_t(g, "TP")  # Trimmed string response
position = cmd_i(g, "TP")  # Integer response  
voltage = cmd_d(g, "MG @AN[1]")  # Double response
```

### File Operations
```julia
# Program files
program_download_file(g, "motion_program.dmc")
program_upload_file(g, "backup_program.dmc")

# Array data (CSV format - simplified implementation)
array_download_file(g, "trajectory_data.csv")
array_upload_file(g, "recorded_data.csv")
```

### Network Discovery
```julia
# Find available controllers
addresses = addresses()  # Returns Vector{String}
for addr in addresses
    println("Found controller: $addr")
end

# Handle IP assignment
assign("192.168.1.100", "00:50:4C:00:12:34")
```

### Motion Control
```julia
# Wait for axes to complete motion
motion_complete(g, "AB")  # Wait for axes A and B

# Poll custom conditions
wait_for_bool(g, "_LFA=1", 100)  # Wait for forward limit on A

# Data recording
record_rate(g, 50.0)  # Set 50ms data record period
```

### Error Handling
```julia
try
    g = GCon("invalid_address")
catch e
    error_msg = gerror(e.code)  # Convert error code to message
    println("Connection failed: $error_msg")
end
```
## Examples

See [docs/gclib_examples.md](docs/gclib_examples.md) for comprehensive examples.
