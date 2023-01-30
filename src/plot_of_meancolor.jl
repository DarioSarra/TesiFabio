include("main.jl")
##

timestamp = clockvalues(5187; seconds = true)

f = Figure(resolution = (5186/2,2593/2))
    plt = image(f[1,1],rotr90(A),
        axis = (aspect = DataAspect(), xlabel = "tempo",
        xticklabelsize = 30,
        xlabelsize = 40,
        xticks = (0:300:5200,clockvalues.(0:300:5200)),
        yticklabelsvisible = false, yticksvisible = false,
        titlesize = 50,
        title = "Colore medio in ogni secondo del film Entergalactic ",)
        )
    f
save(joinpath(cartella,"Plt.png"), f)
