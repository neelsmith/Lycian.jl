module Lycian

using Documenter, DocStringExtensions
using Orthography

import Orthography: tokentypes 
import Orthography: codepoints 

export LycianAscii
export lycianAscii

export tokentypes, codepoints

include("ortho.jl")

end # module
