abstract type AbstractGCLibError <: Exception end

macro define_exception(name)
    quote
        struct $name <: AbstractGCLibError
            msg::String
        end
        Base.showerror(io::IO, e::$name) = println(io, e.msg)
    end
end

@define_exception GUtilityError
@define_exception GTimeoutError
@define_exception GOpenError
@define_exception GReadError
@define_exception GWriteError
@define_exception GCLibError

const ERROR_CODES = Dict(
    G_NO_ERROR => G_NO_ERROR_S,
    G_GCLIB_ERROR => G_GCLIB_ERROR_S,
    G_GCLIB_UTILITY_ERROR => G_GCLIB_UTILITY_ERROR_S,
    G_GCLIB_UTILITY_IP_TAKEN => G_GCLIB_UTILITY_IP_TAKEN_S,
    G_GCLIB_NON_BLOCKING_READ_EMPTY => G_GCLIB_NON_BLOCKING_READ_EMPTY_S,
    G_GCLIB_POLLING_FAILED => G_GCLIB_POLLING_FAILED_S,
    G_TIMEOUT => G_TIMEOUT_S,
    G_OPEN_ERROR => G_OPEN_ERROR_S,
    G_ALREADY_OPEN => G_ALREADY_OPEN_S,
    G_READ_ERROR => G_READ_ERROR_S,
    G_WRITE_ERROR => G_WRITE_ERROR_S,
    G_INVALID_PREPROCESSOR_OPTIONS => G_INVALID_PREPROCESSOR_OPTIONS_S,
    G_COMMAND_CALLED_WITH_ILLEGAL_COMMAND => G_COMMAND_CALLED_WITH_ILLEGAL_COMMAND_S,
    G_DATA_RECORD_ERROR => G_DATA_RECORD_ERROR_S,
    G_UNSUPPORTED_FUNCTION => G_UNSUPPORTED_FUNCTION_S,
    G_FIRMWARE_LOAD_NOT_SUPPORTED => G_FIRMWARE_LOAD_NOT_SUPPORTED_S,
    G_ARRAY_NOT_DIMENSIONED => G_ARRAY_NOT_DIMENSIONED_S,
    G_CONNECTION_NOT_ESTABLISHED => G_CONNECTION_NOT_ESTABLISHED_S,
    G_ILLEGAL_DATA_IN_PROGRAM => G_ILLEGAL_DATA_IN_PROGRAM_S,
    G_UNABLE_TO_COMPRESS_PROGRAM_TO_FIT => G_UNABLE_TO_COMPRESS_PROGRAM_TO_FIT_S,
    G_BAD_RESPONSE_QUESTION_MARK => G_BAD_RESPONSE_QUESTION_MARK_S,
    G_BAD_VALUE_RANGE => G_BAD_VALUE_RANGE_S,
    G_BAD_FULL_MEMORY => G_BAD_FULL_MEMORY_S,
    G_BAD_LOST_DATA => G_BAD_LOST_DATA_S,
    G_BAD_FILE => G_BAD_FILE_S,
    G_BAD_ADDRESS => G_BAD_ADDRESS_S,
    G_BAD_FIRMWARE_LOAD => G_BAD_FIRMWARE_LOAD_S,
    G_GCAPS_OPEN_ERROR => G_GCAPS_OPEN_ERROR_S,
    G_GCAPS_SUBSCRIPTION_ERROR => G_GCAPS_SUBSCRIPTION_ERROR_S
)

function check_error(code::Integer)
    if code != G_NO_ERROR
        error_message = get(ERROR_CODES, code, "Unknown error code: $code")
        if code in [G_GCLIB_ERROR, G_GCLIB_UTILITY_ERROR, G_GCLIB_UTILITY_IP_TAKEN, G_GCLIB_NON_BLOCKING_READ_EMPTY, G_GCLIB_POLLING_FAILED]
            throw(GUtilityError(error_message))
        elseif code in [G_TIMEOUT]
            throw(GTimeoutError(error_message))
        elseif code in [G_OPEN_ERROR, G_ALREADY_OPEN]
            throw(GOpenError(error_message))
        elseif code in [G_READ_ERROR]
            throw(GReadError(error_message))
        elseif code in [G_WRITE_ERROR]
            throw(GWriteError(error_message))
        else
            throw(GCLibError(error_message))
        end
    end
end

"""
    @check status_expr

Macro to check status code from an expression and throw appropriate exception if needed.
"""
macro check(status_expr)
    quote
        status = $(esc(status_expr))
        check_error(status)
    end
end