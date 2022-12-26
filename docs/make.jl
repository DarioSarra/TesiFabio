using TesiFabio
using Documenter

DocMeta.setdocmeta!(TesiFabio, :DocTestSetup, :(using TesiFabio); recursive=true)

makedocs(;
    modules=[TesiFabio],
    authors="Dario",
    repo="https://github.com/DarioSarra/TesiFabio.jl/blob/{commit}{path}#{line}",
    sitename="TesiFabio.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://DarioSarra.github.io/TesiFabio.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/DarioSarra/TesiFabio.jl",
    devbranch="main",
)
