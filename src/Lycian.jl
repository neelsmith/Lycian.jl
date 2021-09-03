module Lycian

using Documenter, DocStringExtensions

using Orthography
import Orthography: tokentypes 
import Orthography: codepoints 

using CitableParserBuilder
using CitableObject
# import CitableParserBuilder: parsetoken

using HTTP, CSV, DataFrames
using Query

export LycianAscii
export lycianAscii
export tokentypes, codepoints


export LycianParser
export parser

export lexicon_df, searchlex

export morph_df, searchmorph


include("ortho.jl")
include("morph.jl")

end # module
