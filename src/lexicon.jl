"URL for HC Lycian lexicon."
LEXICON_URL = "https://raw.githubusercontent.com/Descot21/Lycian/master/lexicon/hc.cex"


"""Construct a DataFrame with Lycian lexicon.

$(SIGNATURES)
"""
function lexicon_df()
    CSV.File(HTTP.get(Lycian.LEXICON_URL).body) |> DataFrame
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