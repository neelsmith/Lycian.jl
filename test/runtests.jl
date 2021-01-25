using Lycian
using Test
using Orthography

@testset "Test supertype of orthography" begin
    lycian = LycianAscii()
    @test typeof(lycian) == LycianAscii
    @test supertype(LycianAscii) == OrthographicSystem
end