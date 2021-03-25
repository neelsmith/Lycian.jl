using Pkg
Pkg.activate(".")
Pkg.instantiate()

push!(LOAD_PATH,"..")

using Documenter, DocStringExtensions
using Unicode
using Lycian


makedocs(
    sitename = "Lycian.jl",
    pages = [
        "Home" => "index.md",
        "Guide" => [
            "guide/guide.md"
        ],
        "API documentation" => [
            "man/index.md"
        ]
    ]
)


deploydocs(
    repo = "github.com/neelsmith/Lycian.jl.git",
)

