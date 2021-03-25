
@testset "Test Unicode transcription" begin
    @test Lycian.ucode("tideimi") == "𐊗𐊆𐊅𐊁𐊆𐊎𐊆"
end


@testset "Test transcription with morpheme boundary" begin
    ascii = "mE=ti prNnawatE"
    lyc = Lycian.ucode(ascii)
    @test lyc == "𐊎𐊚𐊗𐊆 𐊓𐊕𐊑𐊏𐊀𐊇𐊀𐊗𐊚"
end

@testset "Test transcription of words breaking lines" begin
    ascii = "prNnaw-atE"
    lyc = Lycian.ucode(ascii)
    @test lyc == "𐊓𐊕𐊑𐊏𐊀𐊇-𐊀𐊗𐊚"
    @test Lycian.isAlphabetic(ascii)
end