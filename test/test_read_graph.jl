@testset "read_graph" begin

    using DelimitedFiles

    @testset "simple_elist" begin
        fname = "data/simple_elist.txt"
        graph = read_graph(fname, "simple")
        data, header = readdlm(fname, '\t', Int64, header=true)
        @test length(graph.edges) == size(data, 1)
        @test length(graph.first_out) == length(graph.nodes) + 1
        @test length(graph.end_node) == length(graph.edges)
    end

end
