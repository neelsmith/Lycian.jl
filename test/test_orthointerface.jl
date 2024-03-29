
@testset "Test supertype of orthography" begin
    lycian = lycianAscii()
    @test typeof(lycian) == LycianAscii
    @test supertype(LycianAscii) == OrthographicSystem
end

@testset "Test token types" begin
    lycian = lycianAscii()
    ttypes = tokentypes(lycian)
    @test length(ttypes) == 3
end

@testset "Test valid character test" begin
    lycian = lycianAscii()
    @test validcp( "E", lycian)
    @test validcp("u", lycian) == false
end

@testset "Test valid string test" begin
    lycian = lycianAscii()
    @test validstring( "tideimi :", lycian)
end

@testset "Test punctuation classification" begin
    @test Lycian.isPunctuation(":")
    @test Lycian.isPunctuation("a:") == false
end

@testset "Test alphabetic classification" begin
    @test Lycian.isAlphabetic("tideimi")
    @test Lycian.isAlphabetic("tideimi:") == false
end

@testset "Test numeric classification" begin
    @test Lycian.isNumeric("111")
    @test Lycian.isNumeric("123") == false
end


@testset "Test tokenization" begin
    lycian = lycianAscii()    
    tkns = tokenize("tideimi : hrppi : ladi", lycian)
    @test length(tkns) == 5
    @test tkns[1].text == "tideimi"
    #@test tkns[1].tokencategory == Orthography.LexicalToken()
    @test tkns[2].text == ":"
    @test tkns[2].tokencategory == Orthography.PunctuationToken()
end



@testset "Test morpheme marker" begin
    lycian = lycianAscii()    
    tkns = tokenize("ebENnE : xopA : mE=ti prNnawatE", lycian)
    @test length(tkns) == 7
    @test tkns[5].text == "mE"
    @test tkns[6].text == "ti"
end


@testset "Test handling of badly formed strings" begin
    lycian = lycianAscii()  
    badstring = "tideimi, plus !ENGLISH!"
    badtkns = tokenize(badstring, lycian)
    #@test tkns[1].text == "tideimi"
    #@test tkns[2].text == ","
end

@testset "Test non-ascii characters" begin
    satrap = "xssaθrapazate"
    Lycian.isAlphabetic(satrap)
end