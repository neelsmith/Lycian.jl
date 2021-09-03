
struct LycianParser <: CitableParser
    label::AbstractString
    stringparser
    data
end


"""Instantiate a `LycianParser`.

($SIGNATURES)
"""
function parser()
    title = "A Lycian morphological parser"
    @info("Loading morphological data...")
    LycianParser(title, parsestring, morph_df())
end

"URL for Lycian morphology data."
MORPHOLOGY_URL = "https://raw.githubusercontent.com/Descot21/Lycian/master/morphology/analyses.cex"

"URL for HC Lycian lexicon."
LEXICON_URL = "https://raw.githubusercontent.com/Descot21/Lycian/master/lexicon/hc.cex"


"Dictionary of collection names to full URN strings"
urnregistry = Dict(
    "lexicon" => "urn:cite2:trmilli:lexicon.v1:"
)



"""Construct a DataFrame with Lycian morphology.

$(SIGNATURES)
"""
function morph_df()
    CSV.File(HTTP.get(Lycian.MORPHOLOGY_URL).body) |> DataFrame
end

"""Construct a DataFrame with Lycian lexicon.

$(SIGNATURES)
"""
function lexicon_df()
    CSV.File(HTTP.get(Lycian.LEXICON_URL).body) |> DataFrame
end

"""Search morphological data for forms matchng `s`

$(SIGNATURES)
"""
function searchmorph(morphdf, s)
    df = @from i in morphdf begin
        @where contains(i.xlit, s)
        @select {i.word, i.form, i.lexicon}
        @collect DataFrame
    end
    df
end


"""Search lexicon for entries where transliterated lemma matches `s`

$(SIGNATURES)
"""
function searchlex(lexicon, s)
    df = @from i in lexicon begin
        @where contains(i.xlit, s)
        @select {i.urn, i.lemma, i.xlit, i.article}
        @collect DataFrame
    end
    df
end

"""Lookup entry identified by LexemeUrn in Lycian lexicon.

$(SIGNATURES)
"""
function lookuplex(lexicon, lexu::LexemeUrn)
    cite2urn = expand(lexu, urnregistry)
    lookuplex(lexicon, cite2urn.urn)
end


"""Lookup entry identified by Cite2Urn in Lycian lexicon.

$(SIGNATURES)
"""
function lookuplex(lexicon, u::Cite2Urn)
  lookuplex(lexicon, u.urn)
end

"""Lookup entry identified by URN string in Lycian lexicon.

$(SIGNATURES)
"""
function lookuplex(lexicon, urnstring::AbstractString)
    df = @from i in lexicon begin
        @where i.urn == urnstring
        @select {i.lemma, i.xlit, i.article}
        @collect DataFrame
    end
    df
end

"""Parse a single token.

"""
function parsestring(s)

end


"""Parse a single token with parser `p`.

($SIGNATURES)
"""
function parsetoken(p::LycianParser, s::AbstractString)
    stemurn = StemUrn("lycian.allstems")
    ruleurn = RuleUrn("lycian.allrules")
    df = @from i in p.data begin
        @where i.word == s
        @select {i.lexicon, i.form}
        @collect DataFrame
    end
    analyses = []
    for r in eachrow(df)
        lexemeurn = Cite2Urn(r.lexicon) |> abbreviate |> LexemeUrn
        formurn  = Cite2Urn(r.form) |> abbreviate |> FormUrn
        push!(analyses, Analysis(s, lexemeurn, formurn, stemurn, ruleurn ))
    end
    analyses
end