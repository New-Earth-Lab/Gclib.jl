module Gclib

export GCon, version, info, command, cmd, wait_for_bool, motion_complete, addresses
export gsleep, timeout, assign, ip_requests, set_server, server_status, list_servers
export publish_server, remote_connections, cmd_i, cmd_d, cmd_t, record_rate
export program_download_file, program_upload_file, array_download_file, array_upload_file
export gerror

using CEnum

include("libgclib.jl")
using .LibGclib
using .LibGclib: GSize

include("exceptions.jl")

const POLLINGINTERVAL = 0.1 # seconds
const G_SMALL_BUFFER = 1024
const G_LINE_BUFFER = 4096
const MAXPROG = 2048000

mutable struct GCon
    handle::LibGclib.GCon

    function GCon(address::AbstractString)
        handle = Ref{LibGclib.GCon}()
        @check LibGclib.GOption
        @check LibGclib.GOpen(address, handle)

        finalizer(new(handle[])) do g
            LibGclib.GClose(g.handle)
        end
    end
end

function Base.close(g::GCon)
    @check LibGclib.GClose(g.handle)
    g.handle = C_NULL
end

function Base.write(g::GCon, data::AbstractVector{UInt8})
    @check LibGclib.GWrite(g.handle, data, length(data))
end

function Base.read(g::GCon, nb::Integer)
    buffer = Vector{UInt8}(undef, nb)
    total_bytes_read = 0
    temp_bytes_read = Ref{GSize}(0)
    while total_bytes_read < nb
        @check LibGclib.GRead(g.handle, view(buffer, total_bytes_read+1:nb), nb - total_bytes_read, temp_bytes_read)
        total_bytes_read += temp_bytes_read[]
    end
    return view(buffer, 1:total_bytes_read)
end

Base.isopen(g::GCon) = g.handle != C_NULL

# Helper functions equivalent to gclibo

"""
    version() -> String

Get library and gcaps version numbers using GUtility().
"""
function version()
    buffer = Vector{UInt8}(undef, 256)
    len = Ref{GSize}(length(buffer))

    @check LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_VERSION, buffer, len)

    # Try to get gcaps version as well
    str_len = findfirst(==(0), buffer)
    if str_len !== nothing
        str_len -= 1
        if str_len > 0 && len[] > str_len + 1
            remaining_len = Ref{GSize}(length(buffer) - str_len)
            result = LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_VERSION,
                view(buffer, str_len+2:length(buffer)), remaining_len)
            if result == LibGclib.G_NO_ERROR
                buffer[str_len+1] = UInt8(' ')  # Add delimiter
            end
        end
    end

    # Find actual string length
    actual_length = findfirst(==(0), buffer)
    if actual_length === nothing
        actual_length = length(buffer)
    else
        actual_length -= 1
    end

    return String(view(buffer, 1:actual_length))
end

"""
    info(g::GCon) -> String

Get connection information using GUtility().
"""
function info(g::GCon)
    buffer = Vector{UInt8}(undef, 256)
    len = Ref{GSize}(length(buffer))
    @check LibGclib.GUtility(g.handle, LibGclib.G_UTIL_INFO, buffer, len)

    # Find actual string length
    actual_length = findfirst(==(0), buffer)
    if actual_length === nothing
        actual_length = length(buffer)
    else
        actual_length -= 1
    end

    return String(view(buffer, 1:actual_length))
end

"""
    addresses() -> Vector{String}

Get list of available connection addresses.
"""
function addresses()
    buffer = Vector{UInt8}(undef, 8192)
    len = Ref{GSize}(length(buffer))

    # Try gcaps first
    result = LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_ADDRESSES, buffer, len)
    if result == LibGclib.G_NO_ERROR
        actual_length = findfirst(==(0), buffer)
        if actual_length === nothing
            actual_length = length(buffer)
        else
            actual_length -= 1
        end
        address_string = String(view(buffer, 1:actual_length))
        return split(address_string, ',', keepempty=false)
    end

    # Fall back to regular addresses
    @check LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_ADDRESSES, buffer, len)
    actual_length = findfirst(==(0), buffer)
    if actual_length === nothing
        actual_length = length(buffer)
    else
        actual_length -= 1
    end
    address_string = String(view(buffer, 1:actual_length))
    return split(address_string, ',', keepempty=false)
end

"""
    timeout(g::GCon, timeout_ms::Integer)

Set the library timeout using GUtility().
"""
function timeout(g::GCon, timeout_ms::Integer)
    timeout_val = Ref{Int16}(timeout_ms)
    @check LibGclib.GUtility(g.handle, LibGclib.G_UTIL_TIMEOUT_OVERRIDE, timeout_val, C_NULL)
    return nothing
end

"""
    assign(ip::AbstractString, mac::AbstractString)

Assign IP address to MAC address.
"""
function assign(ip::AbstractString, mac::AbstractString)
    # Check if IP is already taken (on Linux/macOS)
    if !isempty(ip) && (Sys.islinux() || Sys.isapple())
        reply = Ref{Int32}(0)
        GC.@preserve ip begin
            LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_PING,
                unsafe_convert(Ptr{UInt8}, pointer(ip)), reply)
        end
        if reply[] != 0
            throw(GUtilityError(get(ERROR_CODES, LibGclib.G_GCLIB_UTILITY_IP_TAKEN, "IP address already taken")))
        end
    end

    # Try gcaps first
    result = GC.@preserve ip mac begin
        LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_ASSIGN,
            unsafe_convert(Ptr{UInt8}, pointer(ip)),
            unsafe_convert(Ptr{UInt8}, pointer(mac)))
    end
    if result == LibGclib.G_NO_ERROR
        return nothing
    end

    # Check again for regular utility (on Linux/macOS)
    if Sys.islinux() || Sys.isapple()
        reply = Ref{Int32}(0)
        GC.@preserve ip begin
            LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_PING,
                unsafe_convert(Ptr{UInt8}, pointer(ip)), reply)
        end
        if reply[] != 0
            throw(GUtilityError(get(ERROR_CODES, LibGclib.G_GCLIB_UTILITY_IP_TAKEN, "IP address already taken")))
        end
    end

    @check GC.@preserve ip mac begin
        LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_ASSIGN,
            unsafe_convert(Ptr{UInt8}, pointer(ip)),
            unsafe_convert(Ptr{UInt8}, pointer(mac)))
    end
    return nothing
end

"""
    ip_requests() -> String

Get list of controllers requesting IP addresses.
"""
function ip_requests()
    buffer = Vector{UInt8}(undef, 8192)
    len = Ref{GSize}(length(buffer))

    # Try gcaps first
    result = LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_IPREQUEST, buffer, len)
    if result == LibGclib.G_NO_ERROR
        actual_length = findfirst(==(0), buffer)
        if actual_length === nothing
            actual_length = length(buffer)
        else
            actual_length -= 1
        end

        if len[] == 0 || actual_length == 0
            # Try once more after a 5 second wait
            sleep(5.0)
            @check LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_IPREQUEST, buffer, len)
            actual_length = findfirst(==(0), buffer)
            if actual_length === nothing
                actual_length = length(buffer)
            else
                actual_length -= 1
            end
        end
        return String(view(buffer, 1:actual_length))
    end

    # Fall back to regular version
    @check LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_IPREQUEST, buffer, len)
    actual_length = findfirst(==(0), buffer)
    if actual_length === nothing
        actual_length = length(buffer)
    else
        actual_length -= 1
    end
    return String(view(buffer, 1:actual_length))
end

"""
    set_server(server_name::AbstractString)

Set the active gcaps server.
"""
function set_server(server_name::AbstractString)
    @check GC.@preserve server_name begin
        LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_SET_SERVER,
            unsafe_convert(Ptr{UInt8}, pointer(server_name)), C_NULL)
    end
    return nothing
end

"""
    server_status() -> String

Get the status of the local gcaps server.
"""
function server_status()
    buffer = Vector{UInt8}(undef, 512)
    len = Ref{GSize}(length(buffer))
    @check LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_SERVER_STATUS, buffer, len)

    actual_length = findfirst(==(0), buffer)
    if actual_length === nothing
        actual_length = length(buffer)
    else
        actual_length -= 1
    end
    return String(view(buffer, 1:actual_length))
end

"""
    list_servers() -> String

List all available gcaps servers on the local network.
"""
function list_servers()
    buffer = Vector{UInt8}(undef, 8192)
    len = Ref{GSize}(length(buffer))
    @check LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_LIST_SERVERS, buffer, len)

    actual_length = findfirst(==(0), buffer)
    if actual_length === nothing
        actual_length = length(buffer)
    else
        actual_length -= 1
    end
    return String(view(buffer, 1:actual_length))
end

"""
    publish_server(name::AbstractString, publish::Bool, save::Bool)

Publish or remove local gcaps server from the network.
"""
function publish_server(name::AbstractString, publish::Bool, save::Bool)
    options = Ref{UInt16}(UInt16(publish) | (UInt16(save) << 1))
    @check GC.@preserve name begin
        LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_PUBLISH_SERVER,
            unsafe_convert(Ptr{UInt8}, pointer(name)), options)
    end
    return nothing
end

"""
    remote_connections() -> String

Get list of remote addresses connected to the local server.
"""
function remote_connections()
    buffer = Vector{UInt8}(undef, 8192)
    len = Ref{GSize}(length(buffer))
    @check LibGclib.GUtility(C_NULL, LibGclib.G_UTIL_GCAPS_REMOTE_CONNECTIONS, buffer, len)

    actual_length = findfirst(==(0), buffer)
    if actual_length === nothing
        actual_length = length(buffer)
    else
        actual_length -= 1
    end
    return String(view(buffer, 1:actual_length))
end

"""
    cmd(g::GCon, command::AbstractString)

Send a command without returning the response.
"""
function cmd(g::GCon, command::AbstractString)
    buffer = Vector{UInt8}(undef, G_SMALL_BUFFER)
    @check GC.@preserve command begin
        LibGclib.GCommand(g.handle, command, buffer, length(buffer), C_NULL)
    end
    return nothing
end

"""
    cmd(g::GCon, command::AbstractString) -> String

Send a command and return the trimmed response.
"""
function cmd(::Type{String}, g::GCon, command::AbstractString)
    buffer = Vector{UInt8}(undef, G_SMALL_BUFFER)
    bytes_read = Ref{GSize}(0)
    @check GC.@preserve command begin
        LibGclib.GCommand(g.handle, command, buffer, length(buffer), bytes_read)
    end

    # Convert to string only the bytes that were actually read
    # The buffer is already null-terminated by GCommand
    actual_length = bytes_read[]
    if actual_length > 0 && buffer[actual_length] == 0
        actual_length -= 1  # Don't include null terminator in string
    end

    response = String(view(buffer, 1:actual_length))
    return rstrip(response, [':', '\n', '\r'])
end

"""
    cmd(::Type{T}, g::GCon, command::AbstractString) -> T where {T<:Union{Integer,AbstractFloat}}

Send a command and return the response parsed as the specified type.
"""
function cmd(::Type{T}, g::GCon, command::AbstractString) where {T<:Union{Integer,AbstractFloat}}
    response = cmd(String, g, command)
    return parse(T, response)
end

# Keep the original cmd_t, cmd_i, cmd_d functions for compatibility
const cmd_t = (g, command) -> cmd(String, g, command)
const cmd_i = (g, command) -> cmd(Int, g, command)
const cmd_d = (g, command) -> cmd(Float64, g, command)

"""
    motion_complete(g::GCon, axes::AbstractString)

Block until all specified axes complete their motion.
"""
function motion_complete(g::GCon, axes::AbstractString)
    for axis in axes
        predicate = "_BG$axis=0"
        wait_for_bool(g, predicate, -1)
    end
    return nothing
end

"""
    wait_for_bool(g::GCon, predicate::AbstractString, trials::Int)

Poll a predicate until it returns true or trials are exhausted.
"""
function wait_for_bool(g::GCon, predicate::AbstractString, trials::Int)
    command = "MG ($predicate)"

    while trials != 0
        result = cmd(Int, g, command)  # This will throw on communication error
        if result != 0  # In Galil, non-zero means true (condition met)
            return nothing
        end

        sleep(POLLINGINTERVAL)
        if trials > 0
            trials -= 1
        end
    end

    throw(GUtilityError(get(ERROR_CODES, LibGclib.G_GCLIB_POLLING_FAILED, "Polling failed")))
end

"""
    record_rate(g::GCon, period_ms::Float64)

Set the asynchronous data record period.
"""
function record_rate(g::GCon, period_ms::Float64)
    if period_ms == 0
        cmd(g, "DR 0")
        return nothing
    end

    # Get controller sample time
    dt = try
        cmd(Float64, g, "TM?") / 1024.0  # ms per controller sample
    catch
        0.9765625  # RIO doesn't have TM
    end

    if dt == 0
        dt = 1  # Avoid division by zero
    end

    period_arg = period_ms / dt

    # Get revision to determine controller type
    revision = cmd(String, g, "\x12\x16")  # ^R^V

    if contains(revision, "DMC18")  # PCI controller
        period_arg = log2(period_arg)
    elseif contains(revision, "DMC40") || contains(revision, "DMC500") || contains(revision, "RIO")
        if period_arg < 2
            period_arg = 2
        end
    elseif contains(revision, "DMC41") || contains(revision, "DMC21")
        if period_arg < 8
            period_arg = 8
        end
    elseif contains(revision, "DMC3")
        if period_arg < 4
            period_arg = 4
        end
    end

    dr_command = "DR $(Int(period_arg))"
    cmd(g, dr_command)
    return nothing
end

"""
    program_download_file(g::GCon, file_path::AbstractString, preprocessor::AbstractString="")

Download a program from file to the controller.
"""
function program_download_file(g::GCon, file_path::AbstractString, preprocessor::AbstractString="")
    if !isfile(file_path)
        throw(GCLibError("File not found: $file_path"))
    end

    program_content = open(file_path, "r") do file
        read(file, String)
    end

    @check GC.@preserve program_content preprocessor begin
        LibGclib.GProgramDownload(g.handle, program_content, preprocessor)
    end
    return nothing
end

"""
    program_upload_file(g::GCon, file_path::AbstractString)

Upload a program from the controller to file.
"""
function program_upload_file(g::GCon, file_path::AbstractString)
    buffer = Vector{UInt8}(undef, MAXPROG)
    @check LibGclib.GProgramUpload(g.handle, buffer, length(buffer))

    # Find the actual length (null-terminated string)
    actual_length = findfirst(==(0), buffer)
    if actual_length === nothing
        actual_length = length(buffer)
    else
        actual_length -= 1  # Don't include the null terminator
    end

    open(file_path, "w") do file
        write(file, view(buffer, 1:actual_length))
    end
    return nothing
end

"""
    gerror(return_code::Integer) -> String

Convert a GReturn error code to a human-readable error message.
"""
function gerror(return_code::Integer)
    return get(ERROR_CODES, return_code, "Unknown error code: $return_code")
end

# Compatibility aliases
const command = (g, cmd_str) -> cmd(String, g, cmd_str)

end # module Gclib
