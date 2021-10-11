# User's guide: orthography


## Trancoding Lycian

The `ucode` function transcodes from ASCII to Unicode in the Lycian range.

```jldoctest
using Lycian
Lycian.ucode("prNnawatE") 

# output

"𐊓𐊕𐊑𐊏𐊀𐊇𐊀𐊗𐊚"
```


## Validating orthography

The `LycianAscii` type implements the `OrthographicSystem` abstraction.  You can create an instance with the `lycianAscii()` function

```jldoctest lyc1
using Lycian
orthography = lycianAscii()
typeof(orthography) |> supertype

# output

Orthography.OrthographicSystem
```

Validate orthography:


```jldoctest lyc1
using Orthography
validstring("prNnawatE", orthography)

# output

true
```

```jldoctest lyc1
validstring("Lycian!", orthography)

# output

false
```

