module Gclib

export GCon, version, info, command, cmd, wait_for_bool, motion_complete, addresses

using CEnum

include("libgclib.jl")
using .LibGclib

include("exceptions.jl")

const POLLINGINTERVAL = 0.1 # seconds

mutable struct GCon
    handle::LibGclib.GCon

    function GCon(address::AbstractString)
        handle = Ref{LibGclib.GCon}()
        @check GOpen(address, handle)

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
    return view(buffer, 1:nb+1)
end

Base.isopen(g::GCon) = g.handle != C_NULL

function version(::GCon)
    response = Vector{UInt8}(undef, LibGclib.G_SMALL_BUFFER)
    GC.@preserve response begin
        @check LibGclib.GVersion(pointer(response), length(response))
    end
    return String(view(response, 1:findfirst(iszero, response)-1))
end

function info(g::GCon)
    response = Vector{UInt8}(undef, LibGclib.G_SMALL_BUFFER)
    GC.@preserve response begin
        @check LibGclib.GInfo(g.handle, pointer(response), length(response))
    end
    return String(view(response, 1:findfirst(iszero, response)-1))
end

@inline function command(g::GCon, command_string::AbstractString)
    response = Vector{UInt8}(undef, LibGclib.G_SMALL_BUFFER)
    bytes_returned = Ref{GSize}(0)
    GC.@preserve response begin
        @check LibGclib.GCommand(g.handle, command_string, pointer(response), length(response), bytes_returned)
    end
    return String(view(response, 1:bytes_returned[]+1))
end

function cmd(::Type{Nothing}, g::GCon, command_string::AbstractString)
    response = Vector{UInt8}(undef, LibGclib.G_SMALL_BUFFER)
    GC.@preserve response begin
        @check LibGclib.GCommand(g.handle, command_string, pointer(response), length(response), C_NULL)
    end
    nothing
end

function cmd(::Type{String}, g::GCon, command_string::AbstractString)
    strip(command(g, command_string), ['\0', ':', '\n', '\r', ' '])
end

function cmd(::Type{T}, g::GCon, command_string::AbstractString) where {T<:Union{Integer,AbstractFloat}}
    parse(T, cmd(String, g, command_string))
end

cmd(g::GCon, command_string::AbstractString) = cmd(String, g, command_string)

function wait_for_bool(g::GCon, predicate::AbstractString, trials::Int=-1)
    cmd_string = "MG ($predicate)"
    while trials != 0
        try
            cmd(Int, g, cmd_string) && return
        catch e
            if e isa AbstractGCLibError
                throw(e)
            else
                Libc.systemsleep(POLLINGINTERVAL)
            end
        end
        trials -= 1
    end
end

function motion_complete(g::GCon, axes::AbstractVector{Char}, trials::Int=-1)
    for axis in axes
        pred = "_BG$axis=0"
        wait_for_bool(g.handle, pred, trials)
    end
end

function addresses()
    response = Vector{UInt8}(undef, LibGclib.G_SMALL_BUFFER)
    GC.@preserve response begin
        @check LibGclib.GAddresses(pointer(response), length(response))
    end
    result = String(view(response, 1:findfirst(iszero, response)-1))
    return split(result, '\n')
end

end # module Gclib
