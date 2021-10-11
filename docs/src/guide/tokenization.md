# User's guide: tokenization


The `Orthography` module also defines a `tokenize` function.

```jldoctest tkns
using Orthography
using Lycian
ortho  = lycianAscii()
tokens = tokenize( "ebENnE : xopA : mE=ti prNnawatE", ortho)
tokens

# output

7-element Vector{OrthographicToken}:
 OrthographicToken("ebENnE", LexicalToken())
 OrthographicToken(":", PunctuationToken())
 OrthographicToken("xopA", LexicalToken())
 OrthographicToken(":", PunctuationToken())
 OrthographicToken("mE", LexicalToken())
 OrthographicToken("ti", LexicalToken())
 OrthographicToken("prNnawatE", LexicalToken())
```