"""Construct a DataFrame with Lycian morphology.

$(SIGNATURES)
"""
function forms_df()
    CSV.File(HTTP.get(Lycian.FORMS_URL).body) |> DataFrame
end

"URL for Lycian morphological forms"
FORMS_URL = "https://raw.githubusercontent.com/Descot21/Lycian/master/morphology/formids.cex"


"""Search DataFrame of forms for entries where label matches `s`

$(SIGNATURES)
"""
function searchforms(formsdf, s)
    df = @from i in formsdf begin
        @where contains(i.label, s)
        @select {i.form, i.label}
        @collect DataFrame
    end
    df
end


"""Lookup entry identified by FormUrn in DataFrame of Lycian forms.

$(SIGNATURES)
"""
function lookupform(formsdf, formu::FormUrn)
    cite2urn = expand(formu, urnregistry)
    lookupform(formsdf, cite2urn.urn)
end


"""Lookup entry identified by Cite2Urn in DataFrame of Lycian forms..

$(SIGNATURES)
"""
function lookupform(formsdf, u::Cite2Urn)
  lookupform(formsdf, u.urn)
end

"""Lookup entry identified by URN string in DataFrame of Lycian forms..

$(SIGNATURES)
"""
function lookupform(formsdf, urnstring::AbstractString)
    df = @from i in formsdf begin
        @where i.urn == urnstring
        @select {i.urn, i.label}
        @collect DataFrame
    end
    df
end