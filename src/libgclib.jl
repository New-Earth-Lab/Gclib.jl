module LibGclib

using CEnum

@static if Sys.islinux()
    const libgclibo = "libgclibo.so"
elseif Sys.iswindows()
    const libgclibo = "gclibo.dll"
else
    error("Unsupported OS")
end

const UB = UInt8

const UW = UInt16

const SW = Int16

const SL = Int32

const UL = UInt32

"""
    GDataRecord4000

Data record struct for DMC-4000 controllers, including 4000, 4200, 4103, and 500x0.
"""
struct GDataRecord4000
    data::NTuple{370, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord4000}, f::Symbol)
    f === :header_0 && return Ptr{UB}(x + 0)
    f === :header_1 && return Ptr{UB}(x + 1)
    f === :header_2 && return Ptr{UB}(x + 2)
    f === :header_3 && return Ptr{UB}(x + 3)
    f === :sample_number && return Ptr{UW}(x + 4)
    f === :input_bank_0 && return Ptr{UB}(x + 6)
    f === :input_bank_1 && return Ptr{UB}(x + 7)
    f === :input_bank_2 && return Ptr{UB}(x + 8)
    f === :input_bank_3 && return Ptr{UB}(x + 9)
    f === :input_bank_4 && return Ptr{UB}(x + 10)
    f === :input_bank_5 && return Ptr{UB}(x + 11)
    f === :input_bank_6 && return Ptr{UB}(x + 12)
    f === :input_bank_7 && return Ptr{UB}(x + 13)
    f === :input_bank_8 && return Ptr{UB}(x + 14)
    f === :input_bank_9 && return Ptr{UB}(x + 15)
    f === :output_bank_0 && return Ptr{UB}(x + 16)
    f === :output_bank_1 && return Ptr{UB}(x + 17)
    f === :output_bank_2 && return Ptr{UB}(x + 18)
    f === :output_bank_3 && return Ptr{UB}(x + 19)
    f === :output_bank_4 && return Ptr{UB}(x + 20)
    f === :output_bank_5 && return Ptr{UB}(x + 21)
    f === :output_bank_6 && return Ptr{UB}(x + 22)
    f === :output_bank_7 && return Ptr{UB}(x + 23)
    f === :output_bank_8 && return Ptr{UB}(x + 24)
    f === :output_bank_9 && return Ptr{UB}(x + 25)
    f === :reserved_0 && return Ptr{SW}(x + 26)
    f === :reserved_2 && return Ptr{SW}(x + 28)
    f === :reserved_4 && return Ptr{SW}(x + 30)
    f === :reserved_6 && return Ptr{SW}(x + 32)
    f === :reserved_8 && return Ptr{SW}(x + 34)
    f === :reserved_10 && return Ptr{SW}(x + 36)
    f === :reserved_12 && return Ptr{SW}(x + 38)
    f === :reserved_14 && return Ptr{SW}(x + 40)
    f === :ethernet_status_a && return Ptr{UB}(x + 42)
    f === :ethernet_status_b && return Ptr{UB}(x + 43)
    f === :ethernet_status_c && return Ptr{UB}(x + 44)
    f === :ethernet_status_d && return Ptr{UB}(x + 45)
    f === :ethernet_status_e && return Ptr{UB}(x + 46)
    f === :ethernet_status_f && return Ptr{UB}(x + 47)
    f === :ethernet_status_g && return Ptr{UB}(x + 48)
    f === :ethernet_status_h && return Ptr{UB}(x + 49)
    f === :error_code && return Ptr{UB}(x + 50)
    f === :thread_status && return Ptr{UB}(x + 51)
    f === :amplifier_status && return Ptr{UL}(x + 52)
    f === :contour_segment_count && return Ptr{UL}(x + 56)
    f === :contour_buffer_available && return Ptr{UW}(x + 60)
    f === :s_plane_segment_count && return Ptr{UW}(x + 62)
    f === :s_plane_move_status && return Ptr{UW}(x + 64)
    f === :s_distance && return Ptr{SL}(x + 66)
    f === :s_plane_buffer_available && return Ptr{UW}(x + 70)
    f === :t_plane_segment_count && return Ptr{UW}(x + 72)
    f === :t_plane_move_status && return Ptr{UW}(x + 74)
    f === :t_distance && return Ptr{SL}(x + 76)
    f === :t_plane_buffer_available && return Ptr{UW}(x + 80)
    f === :axis_a_status && return Ptr{UW}(x + 82)
    f === :axis_a_switches && return Ptr{UB}(x + 84)
    f === :axis_a_stop_code && return Ptr{UB}(x + 85)
    f === :axis_a_reference_position && return Ptr{SL}(x + 86)
    f === :axis_a_motor_position && return Ptr{SL}(x + 90)
    f === :axis_a_position_error && return Ptr{SL}(x + 94)
    f === :axis_a_aux_position && return Ptr{SL}(x + 98)
    f === :axis_a_velocity && return Ptr{SL}(x + 102)
    f === :axis_a_torque && return Ptr{SL}(x + 106)
    f === :axis_a_analog_in && return Ptr{UW}(x + 110)
    f === :axis_a_halls && return Ptr{UB}(x + 112)
    f === :axis_a_reserved && return Ptr{UB}(x + 113)
    f === :axis_a_variable && return Ptr{SL}(x + 114)
    f === :axis_b_status && return Ptr{UW}(x + 118)
    f === :axis_b_switches && return Ptr{UB}(x + 120)
    f === :axis_b_stop_code && return Ptr{UB}(x + 121)
    f === :axis_b_reference_position && return Ptr{SL}(x + 122)
    f === :axis_b_motor_position && return Ptr{SL}(x + 126)
    f === :axis_b_position_error && return Ptr{SL}(x + 130)
    f === :axis_b_aux_position && return Ptr{SL}(x + 134)
    f === :axis_b_velocity && return Ptr{SL}(x + 138)
    f === :axis_b_torque && return Ptr{SL}(x + 142)
    f === :axis_b_analog_in && return Ptr{UW}(x + 146)
    f === :axis_b_halls && return Ptr{UB}(x + 148)
    f === :axis_b_reserved && return Ptr{UB}(x + 149)
    f === :axis_b_variable && return Ptr{SL}(x + 150)
    f === :axis_c_status && return Ptr{UW}(x + 154)
    f === :axis_c_switches && return Ptr{UB}(x + 156)
    f === :axis_c_stop_code && return Ptr{UB}(x + 157)
    f === :axis_c_reference_position && return Ptr{SL}(x + 158)
    f === :axis_c_motor_position && return Ptr{SL}(x + 162)
    f === :axis_c_position_error && return Ptr{SL}(x + 166)
    f === :axis_c_aux_position && return Ptr{SL}(x + 170)
    f === :axis_c_velocity && return Ptr{SL}(x + 174)
    f === :axis_c_torque && return Ptr{SL}(x + 178)
    f === :axis_c_analog_in && return Ptr{UW}(x + 182)
    f === :axis_c_halls && return Ptr{UB}(x + 184)
    f === :axis_c_reserved && return Ptr{UB}(x + 185)
    f === :axis_c_variable && return Ptr{SL}(x + 186)
    f === :axis_d_status && return Ptr{UW}(x + 190)
    f === :axis_d_switches && return Ptr{UB}(x + 192)
    f === :axis_d_stop_code && return Ptr{UB}(x + 193)
    f === :axis_d_reference_position && return Ptr{SL}(x + 194)
    f === :axis_d_motor_position && return Ptr{SL}(x + 198)
    f === :axis_d_position_error && return Ptr{SL}(x + 202)
    f === :axis_d_aux_position && return Ptr{SL}(x + 206)
    f === :axis_d_velocity && return Ptr{SL}(x + 210)
    f === :axis_d_torque && return Ptr{SL}(x + 214)
    f === :axis_d_analog_in && return Ptr{UW}(x + 218)
    f === :axis_d_halls && return Ptr{UB}(x + 220)
    f === :axis_d_reserved && return Ptr{UB}(x + 221)
    f === :axis_d_variable && return Ptr{SL}(x + 222)
    f === :axis_e_status && return Ptr{UW}(x + 226)
    f === :axis_e_switches && return Ptr{UB}(x + 228)
    f === :axis_e_stop_code && return Ptr{UB}(x + 229)
    f === :axis_e_reference_position && return Ptr{SL}(x + 230)
    f === :axis_e_motor_position && return Ptr{SL}(x + 234)
    f === :axis_e_position_error && return Ptr{SL}(x + 238)
    f === :axis_e_aux_position && return Ptr{SL}(x + 242)
    f === :axis_e_velocity && return Ptr{SL}(x + 246)
    f === :axis_e_torque && return Ptr{SL}(x + 250)
    f === :axis_e_analog_in && return Ptr{UW}(x + 254)
    f === :axis_e_halls && return Ptr{UB}(x + 256)
    f === :axis_e_reserved && return Ptr{UB}(x + 257)
    f === :axis_e_variable && return Ptr{SL}(x + 258)
    f === :axis_f_status && return Ptr{UW}(x + 262)
    f === :axis_f_switches && return Ptr{UB}(x + 264)
    f === :axis_f_stop_code && return Ptr{UB}(x + 265)
    f === :axis_f_reference_position && return Ptr{SL}(x + 266)
    f === :axis_f_motor_position && return Ptr{SL}(x + 270)
    f === :axis_f_position_error && return Ptr{SL}(x + 274)
    f === :axis_f_aux_position && return Ptr{SL}(x + 278)
    f === :axis_f_velocity && return Ptr{SL}(x + 282)
    f === :axis_f_torque && return Ptr{SL}(x + 286)
    f === :axis_f_analog_in && return Ptr{UW}(x + 290)
    f === :axis_f_halls && return Ptr{UB}(x + 292)
    f === :axis_f_reserved && return Ptr{UB}(x + 293)
    f === :axis_f_variable && return Ptr{SL}(x + 294)
    f === :axis_g_status && return Ptr{UW}(x + 298)
    f === :axis_g_switches && return Ptr{UB}(x + 300)
    f === :axis_g_stop_code && return Ptr{UB}(x + 301)
    f === :axis_g_reference_position && return Ptr{SL}(x + 302)
    f === :axis_g_motor_position && return Ptr{SL}(x + 306)
    f === :axis_g_position_error && return Ptr{SL}(x + 310)
    f === :axis_g_aux_position && return Ptr{SL}(x + 314)
    f === :axis_g_velocity && return Ptr{SL}(x + 318)
    f === :axis_g_torque && return Ptr{SL}(x + 322)
    f === :axis_g_analog_in && return Ptr{UW}(x + 326)
    f === :axis_g_halls && return Ptr{UB}(x + 328)
    f === :axis_g_reserved && return Ptr{UB}(x + 329)
    f === :axis_g_variable && return Ptr{SL}(x + 330)
    f === :axis_h_status && return Ptr{UW}(x + 334)
    f === :axis_h_switches && return Ptr{UB}(x + 336)
    f === :axis_h_stop_code && return Ptr{UB}(x + 337)
    f === :axis_h_reference_position && return Ptr{SL}(x + 338)
    f === :axis_h_motor_position && return Ptr{SL}(x + 342)
    f === :axis_h_position_error && return Ptr{SL}(x + 346)
    f === :axis_h_aux_position && return Ptr{SL}(x + 350)
    f === :axis_h_velocity && return Ptr{SL}(x + 354)
    f === :axis_h_torque && return Ptr{SL}(x + 358)
    f === :axis_h_analog_in && return Ptr{UW}(x + 362)
    f === :axis_h_halls && return Ptr{UB}(x + 364)
    f === :axis_h_reserved && return Ptr{UB}(x + 365)
    f === :axis_h_variable && return Ptr{SL}(x + 366)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord4000, f::Symbol)
    r = Ref{GDataRecord4000}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord4000}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord4000}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord52000

Data record struct for DMC-52000 controller. Same as DMC-4000, with bank indicator added at byte 40.
"""
struct GDataRecord52000
    data::NTuple{370, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord52000}, f::Symbol)
    f === :header_0 && return Ptr{UB}(x + 0)
    f === :header_1 && return Ptr{UB}(x + 1)
    f === :header_2 && return Ptr{UB}(x + 2)
    f === :header_3 && return Ptr{UB}(x + 3)
    f === :sample_number && return Ptr{UW}(x + 4)
    f === :input_bank_0 && return Ptr{UB}(x + 6)
    f === :input_bank_1 && return Ptr{UB}(x + 7)
    f === :input_bank_2 && return Ptr{UB}(x + 8)
    f === :input_bank_3 && return Ptr{UB}(x + 9)
    f === :input_bank_4 && return Ptr{UB}(x + 10)
    f === :input_bank_5 && return Ptr{UB}(x + 11)
    f === :input_bank_6 && return Ptr{UB}(x + 12)
    f === :input_bank_7 && return Ptr{UB}(x + 13)
    f === :input_bank_8 && return Ptr{UB}(x + 14)
    f === :input_bank_9 && return Ptr{UB}(x + 15)
    f === :output_bank_0 && return Ptr{UB}(x + 16)
    f === :output_bank_1 && return Ptr{UB}(x + 17)
    f === :output_bank_2 && return Ptr{UB}(x + 18)
    f === :output_bank_3 && return Ptr{UB}(x + 19)
    f === :output_bank_4 && return Ptr{UB}(x + 20)
    f === :output_bank_5 && return Ptr{UB}(x + 21)
    f === :output_bank_6 && return Ptr{UB}(x + 22)
    f === :output_bank_7 && return Ptr{UB}(x + 23)
    f === :output_bank_8 && return Ptr{UB}(x + 24)
    f === :output_bank_9 && return Ptr{UB}(x + 25)
    f === :reserved_0 && return Ptr{SW}(x + 26)
    f === :reserved_2 && return Ptr{SW}(x + 28)
    f === :reserved_4 && return Ptr{SW}(x + 30)
    f === :reserved_6 && return Ptr{SW}(x + 32)
    f === :reserved_8 && return Ptr{SW}(x + 34)
    f === :reserved_10 && return Ptr{SW}(x + 36)
    f === :reserved_12 && return Ptr{SW}(x + 38)
    f === :ethercat_bank && return Ptr{UB}(x + 40)
    f === :reserved_14 && return Ptr{UB}(x + 41)
    f === :ethernet_status_a && return Ptr{UB}(x + 42)
    f === :ethernet_status_b && return Ptr{UB}(x + 43)
    f === :ethernet_status_c && return Ptr{UB}(x + 44)
    f === :ethernet_status_d && return Ptr{UB}(x + 45)
    f === :ethernet_status_e && return Ptr{UB}(x + 46)
    f === :ethernet_status_f && return Ptr{UB}(x + 47)
    f === :ethernet_status_g && return Ptr{UB}(x + 48)
    f === :ethernet_status_h && return Ptr{UB}(x + 49)
    f === :error_code && return Ptr{UB}(x + 50)
    f === :thread_status && return Ptr{UB}(x + 51)
    f === :amplifier_status && return Ptr{UL}(x + 52)
    f === :contour_segment_count && return Ptr{UL}(x + 56)
    f === :contour_buffer_available && return Ptr{UW}(x + 60)
    f === :s_plane_segment_count && return Ptr{UW}(x + 62)
    f === :s_plane_move_status && return Ptr{UW}(x + 64)
    f === :s_distance && return Ptr{SL}(x + 66)
    f === :s_plane_buffer_available && return Ptr{UW}(x + 70)
    f === :t_plane_segment_count && return Ptr{UW}(x + 72)
    f === :t_plane_move_status && return Ptr{UW}(x + 74)
    f === :t_distance && return Ptr{SL}(x + 76)
    f === :t_plane_buffer_available && return Ptr{UW}(x + 80)
    f === :axis_a_status && return Ptr{UW}(x + 82)
    f === :axis_a_switches && return Ptr{UB}(x + 84)
    f === :axis_a_stop_code && return Ptr{UB}(x + 85)
    f === :axis_a_reference_position && return Ptr{SL}(x + 86)
    f === :axis_a_motor_position && return Ptr{SL}(x + 90)
    f === :axis_a_position_error && return Ptr{SL}(x + 94)
    f === :axis_a_aux_position && return Ptr{SL}(x + 98)
    f === :axis_a_velocity && return Ptr{SL}(x + 102)
    f === :axis_a_torque && return Ptr{SL}(x + 106)
    f === :axis_a_analog_in && return Ptr{UW}(x + 110)
    f === :axis_a_halls && return Ptr{UB}(x + 112)
    f === :axis_a_reserved && return Ptr{UB}(x + 113)
    f === :axis_a_variable && return Ptr{SL}(x + 114)
    f === :axis_b_status && return Ptr{UW}(x + 118)
    f === :axis_b_switches && return Ptr{UB}(x + 120)
    f === :axis_b_stop_code && return Ptr{UB}(x + 121)
    f === :axis_b_reference_position && return Ptr{SL}(x + 122)
    f === :axis_b_motor_position && return Ptr{SL}(x + 126)
    f === :axis_b_position_error && return Ptr{SL}(x + 130)
    f === :axis_b_aux_position && return Ptr{SL}(x + 134)
    f === :axis_b_velocity && return Ptr{SL}(x + 138)
    f === :axis_b_torque && return Ptr{SL}(x + 142)
    f === :axis_b_analog_in && return Ptr{UW}(x + 146)
    f === :axis_b_halls && return Ptr{UB}(x + 148)
    f === :axis_b_reserved && return Ptr{UB}(x + 149)
    f === :axis_b_variable && return Ptr{SL}(x + 150)
    f === :axis_c_status && return Ptr{UW}(x + 154)
    f === :axis_c_switches && return Ptr{UB}(x + 156)
    f === :axis_c_stop_code && return Ptr{UB}(x + 157)
    f === :axis_c_reference_position && return Ptr{SL}(x + 158)
    f === :axis_c_motor_position && return Ptr{SL}(x + 162)
    f === :axis_c_position_error && return Ptr{SL}(x + 166)
    f === :axis_c_aux_position && return Ptr{SL}(x + 170)
    f === :axis_c_velocity && return Ptr{SL}(x + 174)
    f === :axis_c_torque && return Ptr{SL}(x + 178)
    f === :axis_c_analog_in && return Ptr{UW}(x + 182)
    f === :axis_c_halls && return Ptr{UB}(x + 184)
    f === :axis_c_reserved && return Ptr{UB}(x + 185)
    f === :axis_c_variable && return Ptr{SL}(x + 186)
    f === :axis_d_status && return Ptr{UW}(x + 190)
    f === :axis_d_switches && return Ptr{UB}(x + 192)
    f === :axis_d_stop_code && return Ptr{UB}(x + 193)
    f === :axis_d_reference_position && return Ptr{SL}(x + 194)
    f === :axis_d_motor_position && return Ptr{SL}(x + 198)
    f === :axis_d_position_error && return Ptr{SL}(x + 202)
    f === :axis_d_aux_position && return Ptr{SL}(x + 206)
    f === :axis_d_velocity && return Ptr{SL}(x + 210)
    f === :axis_d_torque && return Ptr{SL}(x + 214)
    f === :axis_d_analog_in && return Ptr{UW}(x + 218)
    f === :axis_d_halls && return Ptr{UB}(x + 220)
    f === :axis_d_reserved && return Ptr{UB}(x + 221)
    f === :axis_d_variable && return Ptr{SL}(x + 222)
    f === :axis_e_status && return Ptr{UW}(x + 226)
    f === :axis_e_switches && return Ptr{UB}(x + 228)
    f === :axis_e_stop_code && return Ptr{UB}(x + 229)
    f === :axis_e_reference_position && return Ptr{SL}(x + 230)
    f === :axis_e_motor_position && return Ptr{SL}(x + 234)
    f === :axis_e_position_error && return Ptr{SL}(x + 238)
    f === :axis_e_aux_position && return Ptr{SL}(x + 242)
    f === :axis_e_velocity && return Ptr{SL}(x + 246)
    f === :axis_e_torque && return Ptr{SL}(x + 250)
    f === :axis_e_analog_in && return Ptr{UW}(x + 254)
    f === :axis_e_halls && return Ptr{UB}(x + 256)
    f === :axis_e_reserved && return Ptr{UB}(x + 257)
    f === :axis_e_variable && return Ptr{SL}(x + 258)
    f === :axis_f_status && return Ptr{UW}(x + 262)
    f === :axis_f_switches && return Ptr{UB}(x + 264)
    f === :axis_f_stop_code && return Ptr{UB}(x + 265)
    f === :axis_f_reference_position && return Ptr{SL}(x + 266)
    f === :axis_f_motor_position && return Ptr{SL}(x + 270)
    f === :axis_f_position_error && return Ptr{SL}(x + 274)
    f === :axis_f_aux_position && return Ptr{SL}(x + 278)
    f === :axis_f_velocity && return Ptr{SL}(x + 282)
    f === :axis_f_torque && return Ptr{SL}(x + 286)
    f === :axis_f_analog_in && return Ptr{UW}(x + 290)
    f === :axis_f_halls && return Ptr{UB}(x + 292)
    f === :axis_f_reserved && return Ptr{UB}(x + 293)
    f === :axis_f_variable && return Ptr{SL}(x + 294)
    f === :axis_g_status && return Ptr{UW}(x + 298)
    f === :axis_g_switches && return Ptr{UB}(x + 300)
    f === :axis_g_stop_code && return Ptr{UB}(x + 301)
    f === :axis_g_reference_position && return Ptr{SL}(x + 302)
    f === :axis_g_motor_position && return Ptr{SL}(x + 306)
    f === :axis_g_position_error && return Ptr{SL}(x + 310)
    f === :axis_g_aux_position && return Ptr{SL}(x + 314)
    f === :axis_g_velocity && return Ptr{SL}(x + 318)
    f === :axis_g_torque && return Ptr{SL}(x + 322)
    f === :axis_g_analog_in && return Ptr{UW}(x + 326)
    f === :axis_g_halls && return Ptr{UB}(x + 328)
    f === :axis_g_reserved && return Ptr{UB}(x + 329)
    f === :axis_g_variable && return Ptr{SL}(x + 330)
    f === :axis_h_status && return Ptr{UW}(x + 334)
    f === :axis_h_switches && return Ptr{UB}(x + 336)
    f === :axis_h_stop_code && return Ptr{UB}(x + 337)
    f === :axis_h_reference_position && return Ptr{SL}(x + 338)
    f === :axis_h_motor_position && return Ptr{SL}(x + 342)
    f === :axis_h_position_error && return Ptr{SL}(x + 346)
    f === :axis_h_aux_position && return Ptr{SL}(x + 350)
    f === :axis_h_velocity && return Ptr{SL}(x + 354)
    f === :axis_h_torque && return Ptr{SL}(x + 358)
    f === :axis_h_analog_in && return Ptr{UW}(x + 362)
    f === :axis_h_halls && return Ptr{UB}(x + 364)
    f === :axis_h_reserved && return Ptr{UB}(x + 365)
    f === :axis_h_variable && return Ptr{SL}(x + 366)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord52000, f::Symbol)
    r = Ref{GDataRecord52000}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord52000}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord52000}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord1806

Data record struct for DMC-1806 controller.

The 18x6 Data record is the same as 4000 except the following.-# No header bytes. Firmware strips it in DR. Software removes it from QR.-# No Ethernet status (bytes 42-49).-# No amplfifier status (bytes 52-55).-# No axis-specific hall input status.
"""
struct GDataRecord1806
    data::NTuple{366, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord1806}, f::Symbol)
    f === :sample_number && return Ptr{UW}(x + 0)
    f === :input_bank_0 && return Ptr{UB}(x + 2)
    f === :input_bank_1 && return Ptr{UB}(x + 3)
    f === :input_bank_2 && return Ptr{UB}(x + 4)
    f === :input_bank_3 && return Ptr{UB}(x + 5)
    f === :input_bank_4 && return Ptr{UB}(x + 6)
    f === :input_bank_5 && return Ptr{UB}(x + 7)
    f === :input_bank_6 && return Ptr{UB}(x + 8)
    f === :input_bank_7 && return Ptr{UB}(x + 9)
    f === :input_bank_8 && return Ptr{UB}(x + 10)
    f === :input_bank_9 && return Ptr{UB}(x + 11)
    f === :output_bank_0 && return Ptr{UB}(x + 12)
    f === :output_bank_1 && return Ptr{UB}(x + 13)
    f === :output_bank_2 && return Ptr{UB}(x + 14)
    f === :output_bank_3 && return Ptr{UB}(x + 15)
    f === :output_bank_4 && return Ptr{UB}(x + 16)
    f === :output_bank_5 && return Ptr{UB}(x + 17)
    f === :output_bank_6 && return Ptr{UB}(x + 18)
    f === :output_bank_7 && return Ptr{UB}(x + 19)
    f === :output_bank_8 && return Ptr{UB}(x + 20)
    f === :output_bank_9 && return Ptr{UB}(x + 21)
    f === :reserved_0 && return Ptr{SW}(x + 22)
    f === :reserved_2 && return Ptr{SW}(x + 24)
    f === :reserved_4 && return Ptr{SW}(x + 26)
    f === :reserved_6 && return Ptr{SW}(x + 28)
    f === :reserved_8 && return Ptr{SW}(x + 30)
    f === :reserved_10 && return Ptr{SW}(x + 32)
    f === :reserved_12 && return Ptr{SW}(x + 34)
    f === :reserved_14 && return Ptr{SW}(x + 36)
    f === :reserved_16 && return Ptr{UB}(x + 38)
    f === :reserved_17 && return Ptr{UB}(x + 39)
    f === :reserved_18 && return Ptr{UB}(x + 40)
    f === :reserved_19 && return Ptr{UB}(x + 41)
    f === :reserved_20 && return Ptr{UB}(x + 42)
    f === :reserved_21 && return Ptr{UB}(x + 43)
    f === :reserved_22 && return Ptr{UB}(x + 44)
    f === :reserved_23 && return Ptr{UB}(x + 45)
    f === :error_code && return Ptr{UB}(x + 46)
    f === :thread_status && return Ptr{UB}(x + 47)
    f === :reserved_24 && return Ptr{UL}(x + 48)
    f === :contour_segment_count && return Ptr{UL}(x + 52)
    f === :contour_buffer_available && return Ptr{UW}(x + 56)
    f === :s_plane_segment_count && return Ptr{UW}(x + 58)
    f === :s_plane_move_status && return Ptr{UW}(x + 60)
    f === :s_distance && return Ptr{SL}(x + 62)
    f === :s_plane_buffer_available && return Ptr{UW}(x + 66)
    f === :t_plane_segment_count && return Ptr{UW}(x + 68)
    f === :t_plane_move_status && return Ptr{UW}(x + 70)
    f === :t_distance && return Ptr{SL}(x + 72)
    f === :t_plane_buffer_available && return Ptr{UW}(x + 76)
    f === :axis_a_status && return Ptr{UW}(x + 78)
    f === :axis_a_switches && return Ptr{UB}(x + 80)
    f === :axis_a_stop_code && return Ptr{UB}(x + 81)
    f === :axis_a_reference_position && return Ptr{SL}(x + 82)
    f === :axis_a_motor_position && return Ptr{SL}(x + 86)
    f === :axis_a_position_error && return Ptr{SL}(x + 90)
    f === :axis_a_aux_position && return Ptr{SL}(x + 94)
    f === :axis_a_velocity && return Ptr{SL}(x + 98)
    f === :axis_a_torque && return Ptr{SL}(x + 102)
    f === :axis_a_analog_in && return Ptr{UW}(x + 106)
    f === :axis_a_reserved_0 && return Ptr{UB}(x + 108)
    f === :axis_a_reserved_1 && return Ptr{UB}(x + 109)
    f === :axis_a_variable && return Ptr{SL}(x + 110)
    f === :axis_b_status && return Ptr{UW}(x + 114)
    f === :axis_b_switches && return Ptr{UB}(x + 116)
    f === :axis_b_stop_code && return Ptr{UB}(x + 117)
    f === :axis_b_reference_position && return Ptr{SL}(x + 118)
    f === :axis_b_motor_position && return Ptr{SL}(x + 122)
    f === :axis_b_position_error && return Ptr{SL}(x + 126)
    f === :axis_b_aux_position && return Ptr{SL}(x + 130)
    f === :axis_b_velocity && return Ptr{SL}(x + 134)
    f === :axis_b_torque && return Ptr{SL}(x + 138)
    f === :axis_b_analog_in && return Ptr{UW}(x + 142)
    f === :axis_b_reserved_0 && return Ptr{UB}(x + 144)
    f === :axis_b_reserved_1 && return Ptr{UB}(x + 145)
    f === :axis_b_variable && return Ptr{SL}(x + 146)
    f === :axis_c_status && return Ptr{UW}(x + 150)
    f === :axis_c_switches && return Ptr{UB}(x + 152)
    f === :axis_c_stop_code && return Ptr{UB}(x + 153)
    f === :axis_c_reference_position && return Ptr{SL}(x + 154)
    f === :axis_c_motor_position && return Ptr{SL}(x + 158)
    f === :axis_c_position_error && return Ptr{SL}(x + 162)
    f === :axis_c_aux_position && return Ptr{SL}(x + 166)
    f === :axis_c_velocity && return Ptr{SL}(x + 170)
    f === :axis_c_torque && return Ptr{SL}(x + 174)
    f === :axis_c_analog_in && return Ptr{UW}(x + 178)
    f === :axis_c_reserved_0 && return Ptr{UB}(x + 180)
    f === :axis_c_reserved_1 && return Ptr{UB}(x + 181)
    f === :axis_c_variable && return Ptr{SL}(x + 182)
    f === :axis_d_status && return Ptr{UW}(x + 186)
    f === :axis_d_switches && return Ptr{UB}(x + 188)
    f === :axis_d_stop_code && return Ptr{UB}(x + 189)
    f === :axis_d_reference_position && return Ptr{SL}(x + 190)
    f === :axis_d_motor_position && return Ptr{SL}(x + 194)
    f === :axis_d_position_error && return Ptr{SL}(x + 198)
    f === :axis_d_aux_position && return Ptr{SL}(x + 202)
    f === :axis_d_velocity && return Ptr{SL}(x + 206)
    f === :axis_d_torque && return Ptr{SL}(x + 210)
    f === :axis_d_analog_in && return Ptr{UW}(x + 214)
    f === :axis_d_reserved_0 && return Ptr{UB}(x + 216)
    f === :axis_d_reserved_1 && return Ptr{UB}(x + 217)
    f === :axis_d_variable && return Ptr{SL}(x + 218)
    f === :axis_e_status && return Ptr{UW}(x + 222)
    f === :axis_e_switches && return Ptr{UB}(x + 224)
    f === :axis_e_stop_code && return Ptr{UB}(x + 225)
    f === :axis_e_reference_position && return Ptr{SL}(x + 226)
    f === :axis_e_motor_position && return Ptr{SL}(x + 230)
    f === :axis_e_position_error && return Ptr{SL}(x + 234)
    f === :axis_e_aux_position && return Ptr{SL}(x + 238)
    f === :axis_e_velocity && return Ptr{SL}(x + 242)
    f === :axis_e_torque && return Ptr{SL}(x + 246)
    f === :axis_e_analog_in && return Ptr{UW}(x + 250)
    f === :axis_e_reserved_0 && return Ptr{UB}(x + 252)
    f === :axis_e_reserved_1 && return Ptr{UB}(x + 253)
    f === :axis_e_variable && return Ptr{SL}(x + 254)
    f === :axis_f_status && return Ptr{UW}(x + 258)
    f === :axis_f_switches && return Ptr{UB}(x + 260)
    f === :axis_f_stop_code && return Ptr{UB}(x + 261)
    f === :axis_f_reference_position && return Ptr{SL}(x + 262)
    f === :axis_f_motor_position && return Ptr{SL}(x + 266)
    f === :axis_f_position_error && return Ptr{SL}(x + 270)
    f === :axis_f_aux_position && return Ptr{SL}(x + 274)
    f === :axis_f_velocity && return Ptr{SL}(x + 278)
    f === :axis_f_torque && return Ptr{SL}(x + 282)
    f === :axis_f_analog_in && return Ptr{UW}(x + 286)
    f === :axis_f_reserved_0 && return Ptr{UB}(x + 288)
    f === :axis_f_reserved_1 && return Ptr{UB}(x + 289)
    f === :axis_f_variable && return Ptr{SL}(x + 290)
    f === :axis_g_status && return Ptr{UW}(x + 294)
    f === :axis_g_switches && return Ptr{UB}(x + 296)
    f === :axis_g_stop_code && return Ptr{UB}(x + 297)
    f === :axis_g_reference_position && return Ptr{SL}(x + 298)
    f === :axis_g_motor_position && return Ptr{SL}(x + 302)
    f === :axis_g_position_error && return Ptr{SL}(x + 306)
    f === :axis_g_aux_position && return Ptr{SL}(x + 310)
    f === :axis_g_velocity && return Ptr{SL}(x + 314)
    f === :axis_g_torque && return Ptr{SL}(x + 318)
    f === :axis_g_analog_in && return Ptr{UW}(x + 322)
    f === :axis_g_reserved_0 && return Ptr{UB}(x + 324)
    f === :axis_g_reserved_1 && return Ptr{UB}(x + 325)
    f === :axis_g_variable && return Ptr{SL}(x + 326)
    f === :axis_h_status && return Ptr{UW}(x + 330)
    f === :axis_h_switches && return Ptr{UB}(x + 332)
    f === :axis_h_stop_code && return Ptr{UB}(x + 333)
    f === :axis_h_reference_position && return Ptr{SL}(x + 334)
    f === :axis_h_motor_position && return Ptr{SL}(x + 338)
    f === :axis_h_position_error && return Ptr{SL}(x + 342)
    f === :axis_h_aux_position && return Ptr{SL}(x + 346)
    f === :axis_h_velocity && return Ptr{SL}(x + 350)
    f === :axis_h_torque && return Ptr{SL}(x + 354)
    f === :axis_h_analog_in && return Ptr{UW}(x + 358)
    f === :axis_h_reserved_0 && return Ptr{UB}(x + 360)
    f === :axis_h_reserved_1 && return Ptr{UB}(x + 361)
    f === :axis_h_variable && return Ptr{SL}(x + 362)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord1806, f::Symbol)
    r = Ref{GDataRecord1806}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord1806}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord1806}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord2103

Data record struct for DMC-2103 controllers.
"""
struct GDataRecord2103
    data::NTuple{268, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord2103}, f::Symbol)
    f === :header_0 && return Ptr{UB}(x + 0)
    f === :header_1 && return Ptr{UB}(x + 1)
    f === :header_2 && return Ptr{UB}(x + 2)
    f === :header_3 && return Ptr{UB}(x + 3)
    f === :sample_number && return Ptr{UW}(x + 4)
    f === :input_bank_0 && return Ptr{UB}(x + 6)
    f === :input_bank_1 && return Ptr{UB}(x + 7)
    f === :input_bank_2 && return Ptr{UB}(x + 8)
    f === :input_bank_3 && return Ptr{UB}(x + 9)
    f === :input_bank_4 && return Ptr{UB}(x + 10)
    f === :input_bank_5 && return Ptr{UB}(x + 11)
    f === :input_bank_6 && return Ptr{UB}(x + 12)
    f === :input_bank_7 && return Ptr{UB}(x + 13)
    f === :input_bank_8 && return Ptr{UB}(x + 14)
    f === :input_bank_9 && return Ptr{UB}(x + 15)
    f === :output_bank_0 && return Ptr{UB}(x + 16)
    f === :output_bank_1 && return Ptr{UB}(x + 17)
    f === :output_bank_2 && return Ptr{UB}(x + 18)
    f === :output_bank_3 && return Ptr{UB}(x + 19)
    f === :output_bank_4 && return Ptr{UB}(x + 20)
    f === :output_bank_5 && return Ptr{UB}(x + 21)
    f === :output_bank_6 && return Ptr{UB}(x + 22)
    f === :output_bank_7 && return Ptr{UB}(x + 23)
    f === :output_bank_8 && return Ptr{UB}(x + 24)
    f === :output_bank_9 && return Ptr{UB}(x + 25)
    f === :error_code && return Ptr{UB}(x + 26)
    f === :general_status && return Ptr{UB}(x + 27)
    f === :s_plane_segment_count && return Ptr{UW}(x + 28)
    f === :s_plane_move_status && return Ptr{UW}(x + 30)
    f === :s_distance && return Ptr{SL}(x + 32)
    f === :t_plane_segment_count && return Ptr{UW}(x + 36)
    f === :t_plane_move_status && return Ptr{UW}(x + 38)
    f === :t_distance && return Ptr{SL}(x + 40)
    f === :axis_a_status && return Ptr{UW}(x + 44)
    f === :axis_a_switches && return Ptr{UB}(x + 46)
    f === :axis_a_stop_code && return Ptr{UB}(x + 47)
    f === :axis_a_reference_position && return Ptr{SL}(x + 48)
    f === :axis_a_motor_position && return Ptr{SL}(x + 52)
    f === :axis_a_position_error && return Ptr{SL}(x + 56)
    f === :axis_a_aux_position && return Ptr{SL}(x + 60)
    f === :axis_a_velocity && return Ptr{SL}(x + 64)
    f === :axis_a_torque && return Ptr{SW}(x + 68)
    f === :axis_a_analog_in && return Ptr{UW}(x + 70)
    f === :axis_b_status && return Ptr{UW}(x + 72)
    f === :axis_b_switches && return Ptr{UB}(x + 74)
    f === :axis_b_stop_code && return Ptr{UB}(x + 75)
    f === :axis_b_reference_position && return Ptr{SL}(x + 76)
    f === :axis_b_motor_position && return Ptr{SL}(x + 80)
    f === :axis_b_position_error && return Ptr{SL}(x + 84)
    f === :axis_b_aux_position && return Ptr{SL}(x + 88)
    f === :axis_b_velocity && return Ptr{SL}(x + 92)
    f === :axis_b_torque && return Ptr{SW}(x + 96)
    f === :axis_b_analog_in && return Ptr{UW}(x + 98)
    f === :axis_c_status && return Ptr{UW}(x + 100)
    f === :axis_c_switches && return Ptr{UB}(x + 102)
    f === :axis_c_stop_code && return Ptr{UB}(x + 103)
    f === :axis_c_reference_position && return Ptr{SL}(x + 104)
    f === :axis_c_motor_position && return Ptr{SL}(x + 108)
    f === :axis_c_position_error && return Ptr{SL}(x + 112)
    f === :axis_c_aux_position && return Ptr{SL}(x + 116)
    f === :axis_c_velocity && return Ptr{SL}(x + 120)
    f === :axis_c_torque && return Ptr{SW}(x + 124)
    f === :axis_c_analog_in && return Ptr{UW}(x + 126)
    f === :axis_d_status && return Ptr{UW}(x + 128)
    f === :axis_d_switches && return Ptr{UB}(x + 130)
    f === :axis_d_stop_code && return Ptr{UB}(x + 131)
    f === :axis_d_reference_position && return Ptr{SL}(x + 132)
    f === :axis_d_motor_position && return Ptr{SL}(x + 136)
    f === :axis_d_position_error && return Ptr{SL}(x + 140)
    f === :axis_d_aux_position && return Ptr{SL}(x + 144)
    f === :axis_d_velocity && return Ptr{SL}(x + 148)
    f === :axis_d_torque && return Ptr{SW}(x + 152)
    f === :axis_d_analog_in && return Ptr{UW}(x + 154)
    f === :axis_e_status && return Ptr{UW}(x + 156)
    f === :axis_e_switches && return Ptr{UB}(x + 158)
    f === :axis_e_stop_code && return Ptr{UB}(x + 159)
    f === :axis_e_reference_position && return Ptr{SL}(x + 160)
    f === :axis_e_motor_position && return Ptr{SL}(x + 164)
    f === :axis_e_position_error && return Ptr{SL}(x + 168)
    f === :axis_e_aux_position && return Ptr{SL}(x + 172)
    f === :axis_e_velocity && return Ptr{SL}(x + 176)
    f === :axis_e_torque && return Ptr{SW}(x + 180)
    f === :axis_e_analog_in && return Ptr{UW}(x + 182)
    f === :axis_f_status && return Ptr{UW}(x + 184)
    f === :axis_f_switches && return Ptr{UB}(x + 186)
    f === :axis_f_stop_code && return Ptr{UB}(x + 187)
    f === :axis_f_reference_position && return Ptr{SL}(x + 188)
    f === :axis_f_motor_position && return Ptr{SL}(x + 192)
    f === :axis_f_position_error && return Ptr{SL}(x + 196)
    f === :axis_f_aux_position && return Ptr{SL}(x + 200)
    f === :axis_f_velocity && return Ptr{SL}(x + 204)
    f === :axis_f_torque && return Ptr{SW}(x + 208)
    f === :axis_f_analog_in && return Ptr{UW}(x + 210)
    f === :axis_g_status && return Ptr{UW}(x + 212)
    f === :axis_g_switches && return Ptr{UB}(x + 214)
    f === :axis_g_stop_code && return Ptr{UB}(x + 215)
    f === :axis_g_reference_position && return Ptr{SL}(x + 216)
    f === :axis_g_motor_position && return Ptr{SL}(x + 220)
    f === :axis_g_position_error && return Ptr{SL}(x + 224)
    f === :axis_g_aux_position && return Ptr{SL}(x + 228)
    f === :axis_g_velocity && return Ptr{SL}(x + 232)
    f === :axis_g_torque && return Ptr{SW}(x + 236)
    f === :axis_g_analog_in && return Ptr{UW}(x + 238)
    f === :axis_h_status && return Ptr{UW}(x + 240)
    f === :axis_h_switches && return Ptr{UB}(x + 242)
    f === :axis_h_stop_code && return Ptr{UB}(x + 243)
    f === :axis_h_reference_position && return Ptr{SL}(x + 244)
    f === :axis_h_motor_position && return Ptr{SL}(x + 248)
    f === :axis_h_position_error && return Ptr{SL}(x + 252)
    f === :axis_h_aux_position && return Ptr{SL}(x + 256)
    f === :axis_h_velocity && return Ptr{SL}(x + 260)
    f === :axis_h_torque && return Ptr{SW}(x + 264)
    f === :axis_h_analog_in && return Ptr{UW}(x + 266)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord2103, f::Symbol)
    r = Ref{GDataRecord2103}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord2103}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord2103}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord1802

Data record struct for DMC-1802 controllers.

The 18x2 Data record is the Same as 2103 except the following.-# No header bytes. Software removes it from QR.-# No analog in axis data.
"""
struct GDataRecord1802
    data::NTuple{152, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord1802}, f::Symbol)
    f === :sample_number && return Ptr{UW}(x + 0)
    f === :input_bank_0 && return Ptr{UB}(x + 2)
    f === :input_bank_1 && return Ptr{UB}(x + 3)
    f === :input_bank_2 && return Ptr{UB}(x + 4)
    f === :input_bank_3 && return Ptr{UB}(x + 5)
    f === :input_bank_4 && return Ptr{UB}(x + 6)
    f === :input_bank_5 && return Ptr{UB}(x + 7)
    f === :input_bank_6 && return Ptr{UB}(x + 8)
    f === :input_bank_7 && return Ptr{UB}(x + 9)
    f === :input_bank_8 && return Ptr{UB}(x + 10)
    f === :input_bank_9 && return Ptr{UB}(x + 11)
    f === :output_bank_0 && return Ptr{UB}(x + 12)
    f === :output_bank_1 && return Ptr{UB}(x + 13)
    f === :output_bank_2 && return Ptr{UB}(x + 14)
    f === :output_bank_3 && return Ptr{UB}(x + 15)
    f === :output_bank_4 && return Ptr{UB}(x + 16)
    f === :output_bank_5 && return Ptr{UB}(x + 17)
    f === :output_bank_6 && return Ptr{UB}(x + 18)
    f === :output_bank_7 && return Ptr{UB}(x + 19)
    f === :output_bank_8 && return Ptr{UB}(x + 20)
    f === :output_bank_9 && return Ptr{UB}(x + 21)
    f === :error_code && return Ptr{UB}(x + 22)
    f === :general_status && return Ptr{UB}(x + 23)
    f === :s_plane_segment_count && return Ptr{UW}(x + 24)
    f === :s_plane_move_status && return Ptr{UW}(x + 26)
    f === :s_distance && return Ptr{SL}(x + 28)
    f === :t_plane_segment_count && return Ptr{UW}(x + 32)
    f === :t_plane_move_status && return Ptr{UW}(x + 34)
    f === :t_distance && return Ptr{SL}(x + 36)
    f === :axis_a_status && return Ptr{UW}(x + 40)
    f === :axis_a_switches && return Ptr{UB}(x + 42)
    f === :axis_a_stop_code && return Ptr{UB}(x + 43)
    f === :axis_a_reference_position && return Ptr{SL}(x + 44)
    f === :axis_a_motor_position && return Ptr{SL}(x + 48)
    f === :axis_a_position_error && return Ptr{SL}(x + 52)
    f === :axis_a_aux_position && return Ptr{SL}(x + 56)
    f === :axis_a_velocity && return Ptr{SL}(x + 60)
    f === :axis_a_torque && return Ptr{SW}(x + 64)
    f === :axis_a_reserved_0 && return Ptr{UB}(x + 66)
    f === :axis_a_reserved_1 && return Ptr{UB}(x + 67)
    f === :axis_b_status && return Ptr{UW}(x + 68)
    f === :axis_b_switches && return Ptr{UB}(x + 70)
    f === :axis_b_stop_code && return Ptr{UB}(x + 71)
    f === :axis_b_reference_position && return Ptr{SL}(x + 72)
    f === :axis_b_motor_position && return Ptr{SL}(x + 76)
    f === :axis_b_position_error && return Ptr{SL}(x + 80)
    f === :axis_b_aux_position && return Ptr{SL}(x + 84)
    f === :axis_b_velocity && return Ptr{SL}(x + 88)
    f === :axis_b_torque && return Ptr{SW}(x + 92)
    f === :axis_b_reserved_0 && return Ptr{UB}(x + 94)
    f === :axis_b_reserved_1 && return Ptr{UB}(x + 95)
    f === :axis_c_status && return Ptr{UW}(x + 96)
    f === :axis_c_switches && return Ptr{UB}(x + 98)
    f === :axis_c_stop_code && return Ptr{UB}(x + 99)
    f === :axis_c_reference_position && return Ptr{SL}(x + 100)
    f === :axis_c_motor_position && return Ptr{SL}(x + 104)
    f === :axis_c_position_error && return Ptr{SL}(x + 108)
    f === :axis_c_aux_position && return Ptr{SL}(x + 112)
    f === :axis_c_velocity && return Ptr{SL}(x + 116)
    f === :axis_c_torque && return Ptr{SW}(x + 120)
    f === :axis_c_reserved_0 && return Ptr{UB}(x + 122)
    f === :axis_c_reserved_1 && return Ptr{UB}(x + 123)
    f === :axis_d_status && return Ptr{UW}(x + 124)
    f === :axis_d_switches && return Ptr{UB}(x + 126)
    f === :axis_d_stop_code && return Ptr{UB}(x + 127)
    f === :axis_d_reference_position && return Ptr{SL}(x + 128)
    f === :axis_d_motor_position && return Ptr{SL}(x + 132)
    f === :axis_d_position_error && return Ptr{SL}(x + 136)
    f === :axis_d_aux_position && return Ptr{SL}(x + 140)
    f === :axis_d_velocity && return Ptr{SL}(x + 144)
    f === :axis_d_torque && return Ptr{SW}(x + 148)
    f === :axis_d_reserved_0 && return Ptr{UB}(x + 150)
    f === :axis_d_reserved_1 && return Ptr{UB}(x + 151)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord1802, f::Symbol)
    r = Ref{GDataRecord1802}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord1802}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord1802}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord30000

Data record struct for DMC-30010 controllers.
"""
struct GDataRecord30000
    data::NTuple{74, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord30000}, f::Symbol)
    f === :header_0 && return Ptr{UB}(x + 0)
    f === :header_1 && return Ptr{UB}(x + 1)
    f === :header_2 && return Ptr{UB}(x + 2)
    f === :header_3 && return Ptr{UB}(x + 3)
    f === :sample_number && return Ptr{UW}(x + 4)
    f === :input_bank_0 && return Ptr{UB}(x + 6)
    f === :input_bank_1 && return Ptr{UB}(x + 7)
    f === :output_bank_0 && return Ptr{UB}(x + 8)
    f === :output_bank_1 && return Ptr{UB}(x + 9)
    f === :error_code && return Ptr{UB}(x + 10)
    f === :thread_status && return Ptr{UB}(x + 11)
    f === :input_analog_2 && return Ptr{UW}(x + 12)
    f === :output_analog_1 && return Ptr{UW}(x + 14)
    f === :output_analog_2 && return Ptr{UW}(x + 16)
    f === :amplifier_status && return Ptr{UL}(x + 18)
    f === :contour_segment_count && return Ptr{UL}(x + 22)
    f === :contour_buffer_available && return Ptr{UW}(x + 26)
    f === :s_plane_segment_count && return Ptr{UW}(x + 28)
    f === :s_plane_move_status && return Ptr{UW}(x + 30)
    f === :s_distance && return Ptr{SL}(x + 32)
    f === :s_plane_buffer_available && return Ptr{UW}(x + 36)
    f === :axis_a_status && return Ptr{UW}(x + 38)
    f === :axis_a_switches && return Ptr{UB}(x + 40)
    f === :axis_a_stop_code && return Ptr{UB}(x + 41)
    f === :axis_a_reference_position && return Ptr{SL}(x + 42)
    f === :axis_a_motor_position && return Ptr{SL}(x + 46)
    f === :axis_a_position_error && return Ptr{SL}(x + 50)
    f === :axis_a_aux_position && return Ptr{SL}(x + 54)
    f === :axis_a_velocity && return Ptr{SL}(x + 58)
    f === :axis_a_torque && return Ptr{SL}(x + 62)
    f === :axis_a_analog_in && return Ptr{UW}(x + 66)
    f === :axis_a_halls && return Ptr{UB}(x + 68)
    f === :axis_a_reserved && return Ptr{UB}(x + 69)
    f === :axis_a_variable && return Ptr{SL}(x + 70)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord30000, f::Symbol)
    r = Ref{GDataRecord30000}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord30000}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord30000}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord47000_ENC

Data record struct for RIO-471xx and RIO-472xx PLCs. Includes encoder fields.
"""
struct GDataRecord47000_ENC
    data::NTuple{72, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord47000_ENC}, f::Symbol)
    f === :header_0 && return Ptr{UB}(x + 0)
    f === :header_1 && return Ptr{UB}(x + 1)
    f === :header_2 && return Ptr{UB}(x + 2)
    f === :header_3 && return Ptr{UB}(x + 3)
    f === :sample_number && return Ptr{UW}(x + 4)
    f === :error_code && return Ptr{UB}(x + 6)
    f === :general_status && return Ptr{UB}(x + 7)
    f === :output_analog_0 && return Ptr{UW}(x + 8)
    f === :output_analog_1 && return Ptr{UW}(x + 10)
    f === :output_analog_2 && return Ptr{UW}(x + 12)
    f === :output_analog_3 && return Ptr{UW}(x + 14)
    f === :output_analog_4 && return Ptr{UW}(x + 16)
    f === :output_analog_5 && return Ptr{UW}(x + 18)
    f === :output_analog_6 && return Ptr{UW}(x + 20)
    f === :output_analog_7 && return Ptr{UW}(x + 22)
    f === :input_analog_0 && return Ptr{UW}(x + 24)
    f === :input_analog_1 && return Ptr{UW}(x + 26)
    f === :input_analog_2 && return Ptr{UW}(x + 28)
    f === :input_analog_3 && return Ptr{UW}(x + 30)
    f === :input_analog_4 && return Ptr{UW}(x + 32)
    f === :input_analog_5 && return Ptr{UW}(x + 34)
    f === :input_analog_6 && return Ptr{UW}(x + 36)
    f === :input_analog_7 && return Ptr{UW}(x + 38)
    f === :output_bank_0 && return Ptr{UW}(x + 40)
    f === :input_bank_0 && return Ptr{UW}(x + 42)
    f === :pulse_count_0 && return Ptr{UL}(x + 44)
    f === :zc_variable && return Ptr{SL}(x + 48)
    f === :zd_variable && return Ptr{SL}(x + 52)
    f === :encoder_0 && return Ptr{SL}(x + 56)
    f === :encoder_1 && return Ptr{SL}(x + 60)
    f === :encoder_2 && return Ptr{SL}(x + 64)
    f === :encoder_3 && return Ptr{SL}(x + 68)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord47000_ENC, f::Symbol)
    r = Ref{GDataRecord47000_ENC}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord47000_ENC}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord47000_ENC}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord47300_ENC

Data record struct for RIO-47300. Includes encoder fields.
"""
struct GDataRecord47300_ENC
    data::NTuple{76, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord47300_ENC}, f::Symbol)
    f === :header_0 && return Ptr{UB}(x + 0)
    f === :header_1 && return Ptr{UB}(x + 1)
    f === :header_2 && return Ptr{UB}(x + 2)
    f === :header_3 && return Ptr{UB}(x + 3)
    f === :sample_number && return Ptr{UW}(x + 4)
    f === :error_code && return Ptr{UB}(x + 6)
    f === :general_status && return Ptr{UB}(x + 7)
    f === :output_analog_0 && return Ptr{UW}(x + 8)
    f === :output_analog_1 && return Ptr{UW}(x + 10)
    f === :output_analog_2 && return Ptr{UW}(x + 12)
    f === :output_analog_3 && return Ptr{UW}(x + 14)
    f === :output_analog_4 && return Ptr{UW}(x + 16)
    f === :output_analog_5 && return Ptr{UW}(x + 18)
    f === :output_analog_6 && return Ptr{UW}(x + 20)
    f === :output_analog_7 && return Ptr{UW}(x + 22)
    f === :input_analog_0 && return Ptr{UW}(x + 24)
    f === :input_analog_1 && return Ptr{UW}(x + 26)
    f === :input_analog_2 && return Ptr{UW}(x + 28)
    f === :input_analog_3 && return Ptr{UW}(x + 30)
    f === :input_analog_4 && return Ptr{UW}(x + 32)
    f === :input_analog_5 && return Ptr{UW}(x + 34)
    f === :input_analog_6 && return Ptr{UW}(x + 36)
    f === :input_analog_7 && return Ptr{UW}(x + 38)
    f === :output_bank_0 && return Ptr{UW}(x + 40)
    f === :output_bank_1 && return Ptr{UW}(x + 42)
    f === :input_bank_0 && return Ptr{UW}(x + 44)
    f === :input_bank_1 && return Ptr{UW}(x + 46)
    f === :pulse_count_0 && return Ptr{UL}(x + 48)
    f === :zc_variable && return Ptr{SL}(x + 52)
    f === :zd_variable && return Ptr{SL}(x + 56)
    f === :encoder_0 && return Ptr{SL}(x + 60)
    f === :encoder_1 && return Ptr{SL}(x + 64)
    f === :encoder_2 && return Ptr{SL}(x + 68)
    f === :encoder_3 && return Ptr{SL}(x + 72)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord47300_ENC, f::Symbol)
    r = Ref{GDataRecord47300_ENC}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord47300_ENC}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord47300_ENC}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord47300_24EX

Data record struct for RIO-47300 with 24EX I/O daughter board.
"""
struct GDataRecord47300_24EX
    data::NTuple{68, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord47300_24EX}, f::Symbol)
    f === :header_0 && return Ptr{UB}(x + 0)
    f === :header_1 && return Ptr{UB}(x + 1)
    f === :header_2 && return Ptr{UB}(x + 2)
    f === :header_3 && return Ptr{UB}(x + 3)
    f === :sample_number && return Ptr{UW}(x + 4)
    f === :error_code && return Ptr{UB}(x + 6)
    f === :general_status && return Ptr{UB}(x + 7)
    f === :output_analog_0 && return Ptr{UW}(x + 8)
    f === :output_analog_1 && return Ptr{UW}(x + 10)
    f === :output_analog_2 && return Ptr{UW}(x + 12)
    f === :output_analog_3 && return Ptr{UW}(x + 14)
    f === :output_analog_4 && return Ptr{UW}(x + 16)
    f === :output_analog_5 && return Ptr{UW}(x + 18)
    f === :output_analog_6 && return Ptr{UW}(x + 20)
    f === :output_analog_7 && return Ptr{UW}(x + 22)
    f === :input_analog_0 && return Ptr{UW}(x + 24)
    f === :input_analog_1 && return Ptr{UW}(x + 26)
    f === :input_analog_2 && return Ptr{UW}(x + 28)
    f === :input_analog_3 && return Ptr{UW}(x + 30)
    f === :input_analog_4 && return Ptr{UW}(x + 32)
    f === :input_analog_5 && return Ptr{UW}(x + 34)
    f === :input_analog_6 && return Ptr{UW}(x + 36)
    f === :input_analog_7 && return Ptr{UW}(x + 38)
    f === :output_bank_0 && return Ptr{UW}(x + 40)
    f === :output_bank_1 && return Ptr{UW}(x + 42)
    f === :input_bank_0 && return Ptr{UW}(x + 44)
    f === :input_bank_1 && return Ptr{UW}(x + 46)
    f === :pulse_count_0 && return Ptr{UL}(x + 48)
    f === :zc_variable && return Ptr{SL}(x + 52)
    f === :zd_variable && return Ptr{SL}(x + 56)
    f === :output_bank_2 && return Ptr{UW}(x + 60)
    f === :output_back_3 && return Ptr{UW}(x + 62)
    f === :input_bank_2 && return Ptr{UW}(x + 64)
    f === :input_bank_3 && return Ptr{UW}(x + 66)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord47300_24EX, f::Symbol)
    r = Ref{GDataRecord47300_24EX}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord47300_24EX}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord47300_24EX}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord47162

Data record struct for RIO-47162.
"""
struct GDataRecord47162
    data::NTuple{76, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord47162}, f::Symbol)
    f === :header_0 && return Ptr{UB}(x + 0)
    f === :header_1 && return Ptr{UB}(x + 1)
    f === :header_2 && return Ptr{UB}(x + 2)
    f === :header_3 && return Ptr{UB}(x + 3)
    f === :sample_number && return Ptr{UW}(x + 4)
    f === :error_code && return Ptr{UB}(x + 6)
    f === :general_status && return Ptr{UB}(x + 7)
    f === :output_analog_0 && return Ptr{UW}(x + 8)
    f === :output_analog_1 && return Ptr{UW}(x + 10)
    f === :output_analog_2 && return Ptr{UW}(x + 12)
    f === :output_analog_3 && return Ptr{UW}(x + 14)
    f === :output_analog_4 && return Ptr{UW}(x + 16)
    f === :output_analog_5 && return Ptr{UW}(x + 18)
    f === :output_analog_6 && return Ptr{UW}(x + 20)
    f === :output_analog_7 && return Ptr{UW}(x + 22)
    f === :input_analog_0 && return Ptr{UW}(x + 24)
    f === :input_analog_1 && return Ptr{UW}(x + 26)
    f === :input_analog_2 && return Ptr{UW}(x + 28)
    f === :input_analog_3 && return Ptr{UW}(x + 30)
    f === :input_analog_4 && return Ptr{UW}(x + 32)
    f === :input_analog_5 && return Ptr{UW}(x + 34)
    f === :input_analog_6 && return Ptr{UW}(x + 36)
    f === :input_analog_7 && return Ptr{UW}(x + 38)
    f === :output_byte_0 && return Ptr{UB}(x + 40)
    f === :output_byte_1 && return Ptr{UB}(x + 41)
    f === :output_byte_2 && return Ptr{UB}(x + 42)
    f === :input_byte_0 && return Ptr{UB}(x + 43)
    f === :input_byte_1 && return Ptr{UB}(x + 44)
    f === :input_byte_2 && return Ptr{UB}(x + 45)
    f === :input_byte_3 && return Ptr{UB}(x + 46)
    f === :input_byte_4 && return Ptr{UB}(x + 47)
    f === :pulse_count_0 && return Ptr{UL}(x + 48)
    f === :zc_variable && return Ptr{SL}(x + 52)
    f === :zd_variable && return Ptr{SL}(x + 56)
    f === :encoder_0 && return Ptr{SL}(x + 60)
    f === :encoder_1 && return Ptr{SL}(x + 64)
    f === :encoder_2 && return Ptr{SL}(x + 68)
    f === :encoder_3 && return Ptr{SL}(x + 72)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord47162, f::Symbol)
    r = Ref{GDataRecord47162}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord47162}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord47162}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    GDataRecord

Data record union, containing all structs and a generic byte array accessor.

Named structs can be used to access typed data by name. Offsets into the data record can also be used by referencing the member `byte_array`.

```c++
{.cpp}
  //Getting the sample counter for the DMC-4000.
  cout << data_record->dmc4000.sample_number << '\\n'; //access by 4000 product
  cout << * ((unsigned short *) (data_record->byte_array + 4)) << '\\n'; //access by pointer arithmetic
```
"""
struct GDataRecord
    data::NTuple{512, UInt8}
end

function Base.getproperty(x::Ptr{GDataRecord}, f::Symbol)
    f === :dmc4000 && return Ptr{GDataRecord4000}(x + 0)
    f === :dmc4103 && return Ptr{GDataRecord4000}(x + 0)
    f === :dmc50000 && return Ptr{GDataRecord4000}(x + 0)
    f === :dmc52000 && return Ptr{GDataRecord52000}(x + 0)
    f === :dmc30000 && return Ptr{GDataRecord30000}(x + 0)
    f === :dmc2103 && return Ptr{GDataRecord2103}(x + 0)
    f === :dmc1806 && return Ptr{GDataRecord1806}(x + 0)
    f === :dmc1802 && return Ptr{GDataRecord1802}(x + 0)
    f === :rio47000 && return Ptr{GDataRecord47000_ENC}(x + 0)
    f === :rio47300 && return Ptr{GDataRecord47300_ENC}(x + 0)
    f === :rio47300_24ex && return Ptr{GDataRecord47300_24EX}(x + 0)
    f === :rio47162 && return Ptr{GDataRecord47162}(x + 0)
    f === :byte_array && return Ptr{NTuple{512, Cuchar}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GDataRecord, f::Symbol)
    r = Ref{GDataRecord}(x)
    ptr = Base.unsafe_convert(Ptr{GDataRecord}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GDataRecord}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const GReturn = Cint

const GCon = Ptr{Cvoid}

const GSize = Cuint

const GOption = Cint

const GCStringOut = Cstring

const GCStringIn = Cstring

const GBufOut = Cstring

const GBufIn = Cstring

const GStatus = Cuchar

const GMemory = Ptr{Cvoid}

"""
    GOpen(address, g)

Open a connection to a Galil Controller.

### Prototype
```c
GReturn GCALL GOpen(GCStringIn address, GCon* g);
```
"""
function GOpen(address, g)
    @ccall libgclibo.GOpen(address::GCStringIn, g::Ptr{GCon})::GReturn
end

"""
    GClose(g)

Closes a connection to a Galil Controller.

### Prototype
```c
GReturn GCALL GClose(GCon g);
```
"""
function GClose(g)
    @ccall libgclibo.GClose(g::GCon)::GReturn
end

"""
    GRead(g, buffer, buffer_len, bytes_read)

Performs a read on the connection.

### Prototype
```c
GReturn GCALL GRead(GCon g, GBufOut buffer, GSize buffer_len, GSize* bytes_read);
```
"""
function GRead(g, buffer, buffer_len, bytes_read)
    @ccall libgclibo.GRead(g::GCon, buffer::GBufOut, buffer_len::GSize, bytes_read::Ptr{GSize})::GReturn
end

"""
    GWrite(g, buffer, buffer_len)

Performs a write on the connection.

### Prototype
```c
GReturn GCALL GWrite(GCon g, GBufIn buffer, GSize buffer_len);
```
"""
function GWrite(g, buffer, buffer_len)
    @ccall libgclibo.GWrite(g::GCon, buffer::GBufIn, buffer_len::GSize)::GReturn
end

"""
    GCommand(g, command, buffer, buffer_len, bytes_returned)

Performs a *command-and-response* transaction on the connection.

### Prototype
```c
GReturn GCALL GCommand(GCon g, GCStringIn command, GBufOut buffer, GSize buffer_len, GSize* bytes_returned);
```
"""
function GCommand(g, command, buffer, buffer_len, bytes_returned)
    @ccall libgclibo.GCommand(g::GCon, command::GCStringIn, buffer::GBufOut, buffer_len::GSize, bytes_returned::Ptr{GSize})::GReturn
end

"""
    GProgramDownload(g, program, preprocessor)

Downloads a program to the controller's program buffer.

### Prototype
```c
GReturn GCALL GProgramDownload(GCon g, GCStringIn program, GCStringIn preprocessor);
```
"""
function GProgramDownload(g, program, preprocessor)
    @ccall libgclibo.GProgramDownload(g::GCon, program::GCStringIn, preprocessor::GCStringIn)::GReturn
end

"""
    GProgramUpload(g, buffer, buffer_len)

Uploads a program from the controller's program buffer.

### Prototype
```c
GReturn GCALL GProgramUpload(GCon g, GBufOut buffer, GSize buffer_len);
```
"""
function GProgramUpload(g, buffer, buffer_len)
    @ccall libgclibo.GProgramUpload(g::GCon, buffer::GBufOut, buffer_len::GSize)::GReturn
end

"""
    GArrayDownload(g, array_name, first, last, buffer)

Downloads array data to a pre-dimensioned array in the controller's array table.

### Prototype
```c
GReturn GCALL GArrayDownload(GCon g, const GCStringIn array_name, GOption first, GOption last, GCStringIn buffer);
```
"""
function GArrayDownload(g, array_name, first, last, buffer)
    @ccall libgclibo.GArrayDownload(g::GCon, array_name::GCStringIn, first::GOption, last::GOption, buffer::GCStringIn)::GReturn
end

"""
    GArrayUpload(g, array_name, first, last, delim, buffer, buffer_len)

Uploads array data from the controller's array table.

### Prototype
```c
GReturn GCALL GArrayUpload(GCon g, const GCStringIn array_name, GOption first, GOption last, GOption delim, GBufOut buffer, GSize buffer_len);
```
"""
function GArrayUpload(g, array_name, first, last, delim, buffer, buffer_len)
    @ccall libgclibo.GArrayUpload(g::GCon, array_name::GCStringIn, first::GOption, last::GOption, delim::GOption, buffer::GBufOut, buffer_len::GSize)::GReturn
end

"""
    GRecord(g, record, method)

Provides a fresh copy of the controller's data record. Data is cast into a union, [`GDataRecord`](@ref).

### Prototype
```c
GReturn GCALL GRecord(GCon g, union GDataRecord* record, GOption method);
```
"""
function GRecord(g, record, method)
    @ccall libgclibo.GRecord(g::GCon, record::Ptr{GDataRecord}, method::GOption)::GReturn
end

"""
    GMessage(g, buffer, buffer_len)

Provides access to unsolicited messages from the controller.

### Prototype
```c
GReturn GCALL GMessage(GCon g, GCStringOut buffer, GSize buffer_len);
```
"""
function GMessage(g, buffer, buffer_len)
    @ccall libgclibo.GMessage(g::GCon, buffer::GCStringOut, buffer_len::GSize)::GReturn
end

"""
    GInterrupt(g, status_byte)

Provides access to PCI and UDP interrupts from the controller.

### Prototype
```c
GReturn GCALL GInterrupt(GCon g, GStatus* status_byte);
```
"""
function GInterrupt(g, status_byte)
    @ccall libgclibo.GInterrupt(g::GCon, status_byte::Ptr{GStatus})::GReturn
end

"""
    GFirmwareDownload(g, filepath)

Upgrade firmware.

### Prototype
```c
GReturn GCALL GFirmwareDownload(GCon g, GCStringIn filepath);
```
"""
function GFirmwareDownload(g, filepath)
    @ccall libgclibo.GFirmwareDownload(g::GCon, filepath::GCStringIn)::GReturn
end

"""
    GUtility(g, request, memory1, memory2)

Provides read/write access to driver settings and convenience features based on the request variable.

### Prototype
```c
GReturn GCALL GUtility(GCon g, GOption request, GMemory memory1, GMemory memory2);
```
"""
function GUtility(g, request, memory1, memory2)
    @ccall libgclibo.GUtility(g::GCon, request::GOption, memory1::GMemory, memory2::GMemory)::GReturn
end

"""
    GSleep(timeout_ms)

Uses [`GUtility`](@ref)() and G_UTIL_SLEEP to provide a blocking sleep call which can be useful for timing-based chores.

### Prototype
```c
void GCALL GSleep(unsigned int timeout_ms);
```
"""
function GSleep(timeout_ms)
    @ccall libgclibo.GSleep(timeout_ms::Cuint)::Cvoid
end

"""
    GVersion(ver, ver_len)

Uses [`GUtility`](@ref)(), G_UTIL_VERSION and G_UTIL_GCAPS_VERSION to provide the library and gcaps version numbers.

### Prototype
```c
GReturn GCALL GVersion(GCStringOut ver, GSize ver_len);
```
"""
function GVersion(ver, ver_len)
    @ccall libgclibo.GVersion(ver::GCStringOut, ver_len::GSize)::GReturn
end

"""
    GAddresses(addresses, addresses_len)

Uses [`GUtility`](@ref)(), G_UTIL_GCAPS_ADDRESSES or G_UTIL_ADDRESSES to provide a listing of all available connection addresses.

### Prototype
```c
GReturn GCALL GAddresses(GCStringOut addresses, GSize addresses_len);
```
"""
function GAddresses(addresses, addresses_len)
    @ccall libgclibo.GAddresses(addresses::GCStringOut, addresses_len::GSize)::GReturn
end

"""
    GInfo(g, info, info_len)

Uses [`GUtility`](@ref)() and G_UTIL_INFO to provide a useful connection string.

### Prototype
```c
GReturn GCALL GInfo(GCon g, GCStringOut info, GSize info_len);
```
"""
function GInfo(g, info, info_len)
    @ccall libgclibo.GInfo(g::GCon, info::GCStringOut, info_len::GSize)::GReturn
end

"""
    GTimeout(g, timeout_ms)

Uses [`GUtility`](@ref)() and G_UTIL_TIMEOUT_OVERRIDE to set the library timeout.

### Prototype
```c
GReturn GCALL GTimeout(GCon g, short timeout_ms);
```
"""
function GTimeout(g, timeout_ms)
    @ccall libgclibo.GTimeout(g::GCon, timeout_ms::Cshort)::GReturn
end

"""
    GCmd(g, command)

Wrapper around [`GCommand`](@ref) for use when the return value is not desired.

### Prototype
```c
GReturn GCALL GCmd(GCon g, GCStringIn command);
```
"""
function GCmd(g, command)
    @ccall libgclibo.GCmd(g::GCon, command::GCStringIn)::GReturn
end

"""
    GCmdT(g, command, trimmed_response, response_len, front)

Wrapper around [`GCommand`](@ref) that trims the response.

### Prototype
```c
GReturn GCALL GCmdT(GCon g, GCStringIn command, GCStringOut trimmed_response, GSize response_len, GCStringOut* front);
```
"""
function GCmdT(g, command, trimmed_response, response_len, front)
    @ccall libgclibo.GCmdT(g::GCon, command::GCStringIn, trimmed_response::GCStringOut, response_len::GSize, front::Ptr{GCStringOut})::GReturn
end

"""
    GCmdI(g, command, value)

Wrapper around [`GCommand`](@ref) that provides the return value of a command parsed into an int.

### Prototype
```c
GReturn GCALL GCmdI(GCon g, GCStringIn command, int* value);
```
"""
function GCmdI(g, command, value)
    @ccall libgclibo.GCmdI(g::GCon, command::GCStringIn, value::Ptr{Cint})::GReturn
end

"""
    GCmdD(g, command, value)

Wrapper around [`GCommand`](@ref) that provides the return value of a command parsed into a double.

### Prototype
```c
GReturn GCALL GCmdD(GCon g, GCStringIn command, double* value);
```
"""
function GCmdD(g, command, value)
    @ccall libgclibo.GCmdD(g::GCon, command::GCStringIn, value::Ptr{Cdouble})::GReturn
end

"""
    GWaitForBool(g, predicate, trials)

Blocking call that returns when the controller evaluates the predicate as true.

### Prototype
```c
GReturn GCALL GWaitForBool(GCon g, GCStringIn predicate, int trials);
```
"""
function GWaitForBool(g, predicate, trials)
    @ccall libgclibo.GWaitForBool(g::GCon, predicate::GCStringIn, trials::Cint)::GReturn
end

"""
    GMotionComplete(g, axes)

Blocking call that returns once all axes specified have completed their motion.

### Prototype
```c
GReturn GCALL GMotionComplete(GCon g, GCStringIn axes);
```
"""
function GMotionComplete(g, axes)
    @ccall libgclibo.GMotionComplete(g::GCon, axes::GCStringIn)::GReturn
end

"""
    GRecordRate(g, period_ms)

Sets the asynchronous data record to a user-specified period via `DR`.

### Prototype
```c
GReturn GCALL GRecordRate(GCon g, double period_ms);
```
"""
function GRecordRate(g, period_ms)
    @ccall libgclibo.GRecordRate(g::GCon, period_ms::Cdouble)::GReturn
end

"""
    GProgramDownloadFile(g, file_path, preprocessor)

Program download from file.

### Prototype
```c
GReturn GCALL GProgramDownloadFile(GCon g, GCStringIn file_path, GCStringIn preprocessor);
```
"""
function GProgramDownloadFile(g, file_path, preprocessor)
    @ccall libgclibo.GProgramDownloadFile(g::GCon, file_path::GCStringIn, preprocessor::GCStringIn)::GReturn
end

"""
    GProgramUploadFile(g, file_path)

Program upload to file.

### Prototype
```c
GReturn GCALL GProgramUploadFile(GCon g, GCStringIn file_path);
```
"""
function GProgramUploadFile(g, file_path)
    @ccall libgclibo.GProgramUploadFile(g::GCon, file_path::GCStringIn)::GReturn
end

"""
    GArrayDownloadFile(g, file_path)

Array download from file.

### Prototype
```c
GReturn GCALL GArrayDownloadFile(GCon g, GCStringIn file_path);
```
"""
function GArrayDownloadFile(g, file_path)
    @ccall libgclibo.GArrayDownloadFile(g::GCon, file_path::GCStringIn)::GReturn
end

"""
    GArrayUploadFile(g, file_path, names)

Array upload to file.

### Prototype
```c
GReturn GCALL GArrayUploadFile(GCon g, GCStringIn file_path, GCStringIn names);
```
"""
function GArrayUploadFile(g, file_path, names)
    @ccall libgclibo.GArrayUploadFile(g::GCon, file_path::GCStringIn, names::GCStringIn)::GReturn
end

"""
    GIpRequests(requests, requests_len)

Uses [`GUtility`](@ref)(), G_UTIL_GCAPS_IPREQUEST or G_UTIL_IPREQUEST to provide a list of all Galil controllers requesting IP addresses via BOOT-P or DHCP.

### Prototype
```c
GReturn GCALL GIpRequests(GCStringOut requests, GSize requests_len);
```
"""
function GIpRequests(requests, requests_len)
    @ccall libgclibo.GIpRequests(requests::GCStringOut, requests_len::GSize)::GReturn
end

"""
    GSetServer(server_name)

Uses [`GUtility`](@ref)(), G_UTIL_GCAPS_SET_SERVER to set the new active server

### Prototype
```c
GReturn GCALL GSetServer(GCStringIn server_name);
```
"""
function GSetServer(server_name)
    @ccall libgclibo.GSetServer(server_name::GCStringIn)::GReturn
end

"""
    GListServers(servers, servers_len)

Uses [`GUtility`](@ref)(), G_UTIL_GCAPS_LIST_SERVERS to provide a list of all available gcaps services on the local network.

### Prototype
```c
GReturn GCALL GListServers(GCStringOut servers, GSize servers_len);
```
"""
function GListServers(servers, servers_len)
    @ccall libgclibo.GListServers(servers::GCStringOut, servers_len::GSize)::GReturn
end

"""
    GPublishServer(name, publish, save)

Uses [`GUtility`](@ref)(), G_UTIL_GCAPS_PUBLISH_SERVER to publish local gcaps server to the local network.

### Prototype
```c
GReturn GCALL GPublishServer(GCStringIn name, GOption publish, GOption save);
```
"""
function GPublishServer(name, publish, save)
    @ccall libgclibo.GPublishServer(name::GCStringIn, publish::GOption, save::GOption)::GReturn
end

"""
    GServerStatus(status, status_len)

Uses [`GUtility`](@ref)(), G_UTIL_GCAPS_SERVER_STATUS to get information on the local server name and if it is published to the local network.

### Prototype
```c
GReturn GCALL GServerStatus(GCStringOut status, GSize status_len);
```
"""
function GServerStatus(status, status_len)
    @ccall libgclibo.GServerStatus(status::GCStringOut, status_len::GSize)::GReturn
end

"""
    GRemoteConnections(connections, connections_length)

Uses [`GUtility`](@ref)(), G_UTIL_GCAPS_REMOTE_CONNECTIONS to get a list of remote addresses connected to the local server.

### Prototype
```c
GReturn GCALL GRemoteConnections(GCStringOut connections, GSize connections_length);
```
"""
function GRemoteConnections(connections, connections_length)
    @ccall libgclibo.GRemoteConnections(connections::GCStringOut, connections_length::GSize)::GReturn
end

"""
    GAssign(ip, mac)

Uses [`GUtility`](@ref)(), G_UTIL_GCAPS_ASSIGN or G_UTIL_ASSIGN to assign an IP address over the Ethernet to a controller at a given MAC address.

### Prototype
```c
GReturn GCALL GAssign(GCStringIn ip, GCStringIn mac);
```
"""
function GAssign(ip, mac)
    @ccall libgclibo.GAssign(ip::GCStringIn, mac::GCStringIn)::GReturn
end

"""
    GError(rc, error, error_len)

Provides a human-readable description string for return codes.

### Prototype
```c
void GCALL GError(GReturn rc, GCStringOut error, GSize error_len);
```
"""
function GError(rc, error, error_len)
    @ccall libgclibo.GError(rc::GReturn, error::GCStringOut, error_len::GSize)::Cvoid
end

"""
    GSetupDownloadFile(g, file_path, options, info, info_len)

Download a saved controller configuration from a file.

### Prototype
```c
GReturn GCALL GSetupDownloadFile(GCon g, GCStringIn file_path, GOption options, GCStringOut info, GSize info_len);
```
"""
function GSetupDownloadFile(g, file_path, options, info, info_len)
    @ccall libgclibo.GSetupDownloadFile(g::GCon, file_path::GCStringIn, options::GOption, info::GCStringOut, info_len::GSize)::GReturn
end

const GALILDATARECORDMAXLENGTH = 512

const G_NO_ERROR = 0

const G_NO_ERROR_S = "no error"

const G_GCLIB_ERROR = -1

const G_GCLIB_ERROR_S = "gclib unexpected error"

const G_GCLIB_UTILITY_ERROR = -2

const G_GCLIB_UTILITY_ERROR_S = "invalid request value or bad arguments were specified to GUtility()"

const G_GCLIB_UTILITY_IP_TAKEN = -3

const G_GCLIB_UTILITY_IP_TAKEN_S = "ip address is already taken by a device on the network"

const G_GCLIB_NON_BLOCKING_READ_EMPTY = -4

const G_GCLIB_NON_BLOCKING_READ_EMPTY_S = "data was not waiting for a zero-timeout read"

const G_GCLIB_POLLING_FAILED = -5

const G_GCLIB_POLLING_FAILED_S = "exit condition not met in specified polling period"

const G_TIMEOUT = -1100

const G_TIMEOUT_S = "device timed out"

const G_OPEN_ERROR = -1101

const G_OPEN_ERROR_S = "device failed to open"

const G_ALREADY_OPEN = -1111

const G_ALREADY_OPEN_S = "Serial or PCI port already open"

const G_READ_ERROR = -1103

const G_READ_ERROR_S = "device read error"

const G_WRITE_ERROR = -1104

const G_WRITE_ERROR_S = "device write error"

const G_INVALID_PREPROCESSOR_OPTIONS = -1204

const G_INVALID_PREPROCESSOR_OPTIONS_S = "preprocessor did not recognize options"

const G_COMMAND_CALLED_WITH_ILLEGAL_COMMAND = -1106

const G_COMMAND_CALLED_WITH_ILLEGAL_COMMAND_S = "illegal command passed to command call"

const G_DATA_RECORD_ERROR = -1107

const G_DATA_RECORD_ERROR_S = "data record error"

const G_UNSUPPORTED_FUNCTION = -1109

const G_UNSUPPORTED_FUNCTION_S = "function not supported on this communication bus"

const G_FIRMWARE_LOAD_NOT_SUPPORTED = -1110

const G_FIRMWARE_LOAD_NOT_SUPPORTED_S = "firmware cannot be loaded on this communication bus to this hardware"

const G_ARRAY_NOT_DIMENSIONED = -1200

const G_ARRAY_NOT_DIMENSIONED_S = "array not dimensioned on controller or wrong size"

const G_CONNECTION_NOT_ESTABLISHED = -1201

const G_CONNECTION_NOT_ESTABLISHED_S = "connection to hardware not established"

const G_ILLEGAL_DATA_IN_PROGRAM = -1202

const G_ILLEGAL_DATA_IN_PROGRAM_S = "illegal ASCII character in program"

const G_UNABLE_TO_COMPRESS_PROGRAM_TO_FIT = -1203

const G_UNABLE_TO_COMPRESS_PROGRAM_TO_FIT_S = "program cannot be compressed to fit on the controller"

const G_BAD_RESPONSE_QUESTION_MARK = -10000

const G_BAD_RESPONSE_QUESTION_MARK_S = "question mark returned by controller"

const G_BAD_VALUE_RANGE = -10002

const G_BAD_VALUE_RANGE_S = "value passed to function was bad or out of range"

const G_BAD_FULL_MEMORY = -10003

const G_BAD_FULL_MEMORY_S = "operation could not complete because of a memory error"

const G_BAD_LOST_DATA = -10004

const G_BAD_LOST_DATA_S = "data was lost due to buffer or fifo limitations"

const G_BAD_FILE = -10005

const G_BAD_FILE_S = "file was not found, contents are invalid, or write failed"

const G_BAD_ADDRESS = -10006

const G_BAD_ADDRESS_S = "a bad address was specified in open"

const G_BAD_FIRMWARE_LOAD = -10008

const G_BAD_FIRMWARE_LOAD_S = "Firmware upgrade failed"

const G_GCAPS_OPEN_ERROR = -20000

const G_GCAPS_OPEN_ERROR_S = "gcaps connection could not be opened"

const G_GCAPS_SUBSCRIPTION_ERROR = -20002

const G_GCAPS_SUBSCRIPTION_ERROR_S = "function requires subscription not specified in GOpen()"

const G_DR = 1

const G_QR = 0

const G_BOUNDS = -1

const G_CR = 0

const G_COMMA = 1

const G_PUBLISH_SERVER = 1

const G_REMOVE_SERVER = 0

const G_UTIL_TIMEOUT = 1

const G_UTIL_TIMEOUT_OVERRIDE = 2

const G_USE_INITIAL_TIMEOUT = -1

const G_UTIL_VERSION = 128

const G_UTIL_INFO = 129

const G_UTIL_SLEEP = 130

const G_UTIL_ADDRESSES = 131

const G_UTIL_IPREQUEST = 132

const G_UTIL_ASSIGN = 133

const G_UTIL_DEVICE_INITIALIZE = 134

const G_UTIL_PING = 135

const G_UTIL_ERROR_CONTEXT = 136

const G_UTIL_GCAPS_HOST = 256

const G_UTIL_GCAPS_VERSION = 257

const G_UTIL_GCAPS_KEEPALIVE = 258

const G_UTIL_GCAPS_ADDRESSES = 259

const G_UTIL_GCAPS_IPREQUEST = 260

const G_UTIL_GCAPS_ASSIGN = 261

const G_UTIL_GCAPS_PING = 262

const G_UTIL_GCAPS_LIST_SERVERS = 263

const G_UTIL_GCAPS_PUBLISH_SERVER = 264

const G_UTIL_GCAPS_SET_SERVER = 265

const G_UTIL_GCAPS_SERVER_STATUS = 266

const G_UTIL_GCAPS_REMOTE_CONNECTIONS = 267

const G_UTIL_GCAPS_SERVER_INFO = 268

const G_UTIL_GCAPS_ADDRESSES_GET_REMEMBERED = 269

const G_UTIL_GCAPS_ADDRESSES_SET_REMEMBERED = 270

const G_SMALL_BUFFER = 1024

const G_HUGE_BUFFER = 524288

const G_LINE_BUFFER = 80

const MALLOCBUF = G_HUGE_BUFFER

const MAXPROG = MALLOCBUF

const MAXARRAY = MALLOCBUF

const POLLINGINTERVAL = 100

# exports
const PREFIXES = ["G"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
