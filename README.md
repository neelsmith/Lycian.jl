
![build](https://github.com/neelsmith/Lycian.jl/actions/workflows/Documentation.yml/badge.svg)



# Lycian.jl

A Julia module for working with a digital corpus of Lycian texts.  It allows you to:

- validate the orthography of a text, and convert between an ASCII-based orthography and the Lycian range of Unicode.
- tokenize text in Lycian using the MID [Orthography interface](https://hcmid.github.io/Orthography.jl/stable/) for parsing texts into classified tokens
- analyze the morphology of lexical tokens using the [CitableParser](https://neelsmith.github.io/CitableParserBuilder.jl/stable/) interface.  Analyses identify lexemes and forms with URN values that can be used to look up entries in a Lycian lexicon, and a Lycian morphological database, respectively.

See [documentation](https://neelsmith.github.io/Lycian.jl/stable/).