using Lycian
using Test
using Orthography

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
    @test validchar(lycian, "E")
    @test validchar(lycian, "u") == false
end

@testset "Test valid string test" begin
    lycian = lycianAscii()
    @test validstring(lycian, "tideimi :")
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

@testset "Test Unicode transcription" begin
    @test Lycian.ucode("tideimi") == "𐊗𐊆𐊅𐊁𐊆𐊎𐊆"
end

@testset "Test tokenization" begin
    lycian = lycianAscii()    
    tkns = lycian.tokenizer("tideimi : hrppi : ladi")
    @test length(tkns) == 5
    @test tkns[1].text == "tideimi"
    #@test tkns[1].tokencategory == Orthography.LexicalToken()
    @test tkns[2].text == ":"
    @test tkns[2].tokencategory == Orthography.PunctuationToken()


end

@testset "Test handling of badly formed strings" begin
    lycian = lycianAscii()  
    badstring = "tideimi, plus !ENGLISH!"
    badtkns = lycian.tokenizer(badstring)
    #@test tkns[1].text == "tideimi"
    #@test tkns[2].text == ","
end