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