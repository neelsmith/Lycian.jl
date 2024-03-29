struct LycianParser <: CitableParser
    label::AbstractString
    data
end

"""Instantiate a `LycianParser`.

($SIGNATURES)
"""
function lycianParser()
    title = "A Lycian morphological parser"
    @info("Loading morphological data...")
    df = morph_df()
    @info("Done loading.")
    LycianParser(title, df)
end

"URL for Lycian morphology data."
MORPHOLOGY_URL = "https://raw.githubusercontent.com/Descot21/Lycian/master/morphology/analyses.cex"


"""Construct a DataFrame with Lycian morphology.

$(SIGNATURES)
"""
function morph_df()
    CSV.File(HTTP.get(Lycian.MORPHOLOGY_URL).body) |> DataFrame
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


"""Parse a single token in LycianAscii orthography.

$(SIGNATURES)
"""
function parsetoken(s::AbstractString, parser::LycianParser, data = nothing)
    stemurn = StemUrn("lycian.allstems")
    ruleurn = RuleUrn("lycian.allrules")

    df = isnothing(data) || isempty(data) ? morph_df() : data
    subdf = @from i in df begin
        @where i.word == s
        @select {i.lexicon, i.form}
        @collect DataFrame
    end
    analyses = []
    for r in eachrow(subdf)
        lexemeurn = Cite2Urn(r.lexicon) |> abbreviate |> LexemeUrn
        #@info("Form ", r.form, " lex ", r.lexicon)
        formurn  = Cite2Urn(r.form) |> abbreviate |> FormUrn
        push!(analyses, Analysis(s, lexemeurn, formurn, stemurn, ruleurn ))
    end
    analyses
end

