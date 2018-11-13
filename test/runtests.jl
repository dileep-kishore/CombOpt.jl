using CombOpt
using Test

@test isempty(detect_ambiguities(Base, Core, CombOpt))

tests = [
    "read_graph",
    "dijkstra",
    "bellman_ford",
    "forward_star",
]

if length(ARGS) > 0
    tests = ARGS
end

@testset "CombOpt" begin

    for t in tests
        fp = joinpath(dirname(@__FILE__), "test_$t.jl")
        println("$fp ...")
        include(fp)
    end

end
