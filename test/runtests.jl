using IndexedVectors
using Test

@testset "IndexedVectors.jl" begin
    data = [("a", 100), ("b", 200), ("c", 300)]
    iv = IndexedVector(data, x -> x[1])

    @test iv[1] == ("a", 100)
    @test iv["b"] == ("b", 200)
end
