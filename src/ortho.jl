

"An orthographic system for encoding the Lycian alphabet primarily using ASCII characaters."
struct LycianAscii <: OrthographicSystem
    codepoints
    tokencategories
    tokenizer
end

"Instantiate a LycianAscii with correct code points and token types."
function lycianAscii()
    cps = "aebBgdiwzΘykqlmnMNopKrstTAEhx" *
    ":15" * "- \t\n"
    ttypes = [
        Orthography.LexicalToken,
        Orthography.NumericToken,
        Orthography.PunctuationToken,
    ]
    LycianAscii(cps, ttypes, tokenizeLycian)
end


"Create correct `OrthographicToken` for a given string."
function tokenforstring(s::AbstractString)
    if isNumeric(s)
        OrthographicToken(s, NumericToken())
    elseif isAlphabetic(s)
        OrthographicToken(s, LexicalToken())
    elseif isPunctuation(s)
        OrthographicToken(s, PunctuationToken())
    else
        OrthographicToken(s, Orthography.UnanalyzedToken())
    end
end

"Tokenize Lycian text."
function tokenizeLycian(s::AbstractString)
    wsdelimited = split(s)
    morphemes = map(s -> split(s,"="), wsdelimited)
    tknstrings = collect(Iterators.flatten(morphemes))
    tkns = map(t -> tokenforstring(t), tknstrings)
end


"True if all characters in s are numeric"
function isNumeric(s::AbstractString)
    chlist = split(s,"")
    numlist = "15⑩½"
    tfs = map(c -> occursin(c, numlist), chlist)
    nogood = false in tfs
    !nogood
end

"Compose a string with all alphabetic characters."
function alphabetic()
    "aebBgdiwzΘykqlmnMNopKrstTAEhx-"
end


"True if all characters in s are alphabetic."
function isAlphabetic(s::AbstractString)
    chlist = split(s,"")
    alphas =  alphabetic()
    tfs = []
    for i in collect(eachindex(s)) 
        push!(tfs, occursin(s[i], alphas))
    end
    #tfs = map(c -> occursin(c, alphas), chlist)
    nogood = false in tfs
   
    !nogood
end

"True if s is the interpunctuation mark."
function isPunctuation(s::AbstractString)::Bool
    s == ":" 
end



"TBA.  Convert ASCII encoding to Lycian Unicode range"
function ucode(s::AbstractString)
    unicodeDictionary = a2uDict()
    #chlist = split(s, "")
    #map(c -> unicodeDictionary[only(c)], chlist)

    
    lycianCPs = []
    for c in s
        push!(lycianCPs, unicodeDictionary[c])
    end
    
    join(lycianCPs, "")
end


"Compose a map of ASCIIish characters to Lycian unicode code points."
function a2uDict()
    Dict(
        'a' => "𐊀",
        'e' => "𐊁",
        'b' => "𐊂",
        'B' => "𐊃",
        'g' => "𐊄",
        'd' => "𐊅",
        'i' => "𐊆",
        'w' => "𐊇",
        'z' => "𐊈",
        # Accept either of two thetas. Sigh. Unicode.
        #'θ' => "𐊉",
        '\u03b8' => "𐊉",
        '\u0398' => "𐊉",
        'y' => "𐊊",
        'k' => "𐊋",
        'q' => "𐊌",
        'l' => "𐊍",
        'm' => "𐊎",
        'n' => "𐊏",
        'M' => "𐊐",
        'N' => "𐊑",
        'o' => "𐊒",
        'p' => "𐊓",
        'K' => "𐊔",
        'r' => "𐊕",
        's' => "𐊖",
        't' => "𐊗",
        'T' => "𐊘",
        'A' => "𐊙",
        'E' => "𐊚",
        'h' => "𐊛",
        'x' => "𐊜",
        ':' => ":",
        '.' => ".",
        ' ' => " ",
        '1' => "I",
        '5' => "〇",
        '⑩' => "⑩",
        '½' => "½",
        '-' => "-",
        '=' => ""
    )
end
