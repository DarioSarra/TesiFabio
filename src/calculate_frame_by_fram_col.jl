include("main.jl")
## calculate mean color per frame
path = "/Users/dariosarra/Documents/House/TesiFabio/Entergalactic.mp4"
movie = VideoIO.openvideo(path)
c_avg = RGB{Float64}[]
    map(x->convert(RGB{Float64}, x),img)
    push!(c_avg,sum(img)/length(img))
end
jldsave("/Users/dariosarra/Documents/House/TesiFabio/c_avg.jld2";c_avg)
