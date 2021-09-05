# Run this from repository root, e.g. with
# 
#    julia --project=docs/ docs/make.jl
#
# Run this from repository root to serve:
#
#   julia -e 'using LiveServer; serve(dir="docs/build")'julia -e 'using LiveServer; serve(dir="docs/build")' 
#
using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Documenter, DocStringExtensions
using Unicode
using Lycian


makedocs(
    sitename = "Lycian.jl",
    pages = [
        "Home" => "index.md",
        "Guide" => [
            "guide/orthography.md",
            "guide/tokenization.md",
            "guide/morphology.md",
            "guide/analysis.md"
            
        ],
        "API documentation" => [
            "man/index.md"
        ]
    ]
)


deploydocs(
    repo = "github.com/neelsmith/Lycian.jl.git",
)

