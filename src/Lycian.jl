module Lycian

using Documenter, DocStringExtensions

using Orthography
import Orthography: OrthographyTrait
import Orthography: tokentypes 
import Orthography: codepoints 
import Orthography: tokenize 

using CitableParserBuilder
using CitableObject

using HTTP, CSV, DataFrames
using Query

export urnregistry

"Dictionary of collection names to full URN strings"
urnregistry = Dict(
    "lexicon" => "urn:cite2:trmilli:lexicon.v1:",
    "morphforms" => "urn:cite2:trmilli:morphforms.v1:"
)

export LycianAscii
export lycianAscii
export tokentypes, codepoints
export ucode


export LycianParser
export parser
export lexicon_df, lookuplex, searchlex
export morph_df, searchmorph
export forms_df, lookupform

include("ortho.jl")
include("morph.jl")
include("forms.jl")
include("lexicon.jl")

end # module
