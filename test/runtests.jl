using IndexedVectors
using Test

@testset "IndexedVectors.jl" begin
    data = [("a", 100), ("b", 200), ("c", 300), ("1", 400)]
    iv = IndexedVector(data, x -> x[1])

    @test iv[1] == ("a", 100)
    @test iv["b"] == ("b", 200)
    @test iv[1:2] == [("a", 100), ("b", 200)]
    @test iv[[2, 1, 3]] == [("b", 200), ("a", 100), ("c", 300)]
    @test sort(iv) == [("1", 400), ("a", 100), ("b", 200), ("c", 300)]
end
