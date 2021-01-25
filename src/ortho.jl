

"An orthographic system for encoding the Lycian alphabet primarily using ASCII characaters."
struct LycianAscii <: OrthographicSystem
    codepoints
    tokencategories
end

"Instantiate a LycianAscii with correct code points and token types."
function lycianAscii()
    cps = "aebBgdiwzΘykqlmnMNopKrstTAEhx" *
    ":15" * " \t\n"
    ttypes = [
        Orthography.AlphabeticToken,
        Orthography.NumericToken,
        Orthography.PunctuationToken,
    ]
    LycianAscii(cps, ttypes)
end

# ucode(s)
# function tokenize(ortho::OrthographicSystem, s::AbstractString, tokens::Array{OrthographicToken}=[])
#=

𐊀#a
𐊁#e
𐊂#b
𐊃#B
𐊄#g
𐊅#d
𐊆#i
𐊇#w
𐊈#z
𐊉#Θ
𐊊#y
𐊋#k
𐊌#q
𐊍#l
𐊎#m
𐊏#n
𐊐#M
𐊑#N
𐊒#o
𐊓#p
𐊔#K
𐊕#r
𐊖#s
𐊗#t
𐊘#T
𐊙#A
𐊚#E
𐊛#h
𐊜#x

=#