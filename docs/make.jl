using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")


using Documenter, DocStringExtensions, Lycian

makedocs(sitename = "Lycian Documentation")
