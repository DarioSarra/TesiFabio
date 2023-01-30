include("main.jl")
##
cartella = "/Users/dariosarra/Documents/House/TesiFabio/"
colorxframe = load_object(joinpath(cartella,"c_avg.jld2"))
duration = Int64(ceil(VideoIO.get_duration(path)))
video_duration = VideoIO.get_duration(path)
frame_rate = Int(ceil(length(colorxframe)/video_duration))
# remove first 13s and 7m37s
startcut = Int64(13*frame_rate)
endcut = Int64((7*60+57)*frame_rate)
meancolor = colorxframe[startcut : end - endcut]
duration_in_s = Int(round(length(meancolor)/frame_rate))
##define how many seconds per bin
bin_size_in_seconds = 1
duration_in_bins = Int64(ceil(duration_in_s/bin_size_in_seconds))
#define a range with
nframes = length(meancolor)
framebins = range(1,nframes, length = duration_in_bins)
    framebins = Base.Iterators.drop(framebins,1)
collect(framebins)[end]
start = 1
compress_col = RGB{Float64}[]
for i in framebins
    idx = Int64(floor(i))
    push!(compress_col,sum(meancolor[start:idx])/length(meancolor[start:idx]))
    start = idx
end
compress_col
## create an array to build an image from the vector
im_height = Int64(round(length(compress_col)/2))
A = fill(RGB(0.0,0.0,0.0),(im_height,length(compress_col)))
for i in 1:im_height
    A[i,:] = compress_col
end
A
save(joinpath(cartella,"test.png"), A)
