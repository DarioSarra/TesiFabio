include("main.jl")
##
cartella = "/Users/dariosarra/Documents/House/TesiFabio/"
path = "/Users/dariosarra/Documents/House/TesiFabio/Entergalactic.mp4"
path = "/Users/dariosarra/Documents/House/TesiFabio/Full.mov"

movie = VideoIO.openvideo(path)

#= to find the look at the movie frame corresponding to a specific index in the
movie color array we need to account for the frames remove at the start of the
movie. The seek function  search using seconds as input. SO to find a specific
frame you need to convert the index with bin_size_in_seconds and add 13s=#
seek(movie,framevalues("0h:20m:05s"))
    screenshot = read(movie)
    

save(joinpath(cartella,"party1.png"), screenshot) #tempo "0h:10m:05s"
save(joinpath(cartella,"party2.png"), screenshot) #tempo "0h:19m:03s"
