# User's guide: morphology

The `LycianParser` class implements the `CitableParser` interface.  You can instantiate a `LycianParser` with the `parser()` function.


```jldoctest parse
using Lycian
lycianparser = parser()
typeof(lycianparser) |> supertype

# output

CitableParser
```

!!! warning "Prerequisite"
    Creating a parser downloads a dataset over the internet into a `DataFrame`.  If you are not online, you will have to manually create a parser. Here's an example:
    
    `lycianparser = LycianParser("A Lycian morphological parser", parsestring, morph_df())`
    
    


## Parsing strings

The most efficient way to parse a string value for a single token is to provide three parameters to the `parsetoken` function: the parser, the string value, and the data set that the parser has already downloaded.

The parser comes up with only one analysis for the form *tideimis*.

```jldoctest parse
parses = parsetoken(lycianparser, "tideimis", lycianparser.data)
length(parses)

# output

1
```

## The lexicon

## The morphological database