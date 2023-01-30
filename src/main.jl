using VideoIO
using Images
using ImageIO
using CairoMakie
using Colors
using JLD2
# using ImageAxesadd
# using Plots
# using ImageShow
# using ImageView

function clockvalues(x; seconds = false)
    hh = x÷3600
    rhh = x%3600
    mm = rhh÷60
    ss = rhh%60
    seconds ? (res = "$(hh)h:$(mm)m:$(ss)s") : (res = "$(hh)h:$(mm)m")
    return res
end

function framevalues(timestamp::String)
    pre_h = match(r"\d+h",timestamp)
    pre_m = match(r"\d+m",timestamp)
    pre_s = match(r"\d+s",timestamp)
    
    hours = isnothing(pre_h) ? 0 : parse(Int64,pre_h.match[1:end-1])
    minutes = isnothing(pre_m) ? 0 : parse(Int64,pre_m.match[1:end-1])
    seconds = isnothing(pre_s) ? 0 : parse(Int64,pre_s.match[1:end-1])
    return hours*3600 + minutes*60 + seconds
end
