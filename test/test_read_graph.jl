@testset "read_graph" begin

    using DelimitedFiles

    @testset "simple" begin
        folder = "data/networks/simple"
        for fname in readdir(folder)
            file = joinpath(folder, fname)
            graph = read_graph(file, "simple")
            data, header = readdlm(file, '\t', Int64, header=true)
            @test length(graph.edges) == size(data, 1)
            @test length(graph.first_out) == length(graph.nodes) + 1
            @test length(graph.end_node) == length(graph.edges)
        end
    end

    @testset "distance" begin
        folder = "data/networks/distance"
        for fname in readdir(folder)
            file = joinpath(folder, fname)
            graph = read_graph(file, "distance")
            data, header = readdlm(file, '\t', Int64, header=true)
            @test length(graph.edges) == size(data, 1)
            @test length(graph.first_out) == length(graph.nodes) + 1
            @test length(graph.end_node) == length(graph.edges)
        end
    end

    @testset "capacity" begin
        folder = "data/networks/capacity"
        for fname in readdir(folder)
            file = joinpath(folder, fname)
            graph = read_graph(file, "capacity")
            data, header = readdlm(file, '\t', Int64, header=true)
            @test length(graph.edges) == size(data, 1)
            @test length(graph.first_out) == length(graph.nodes) + 1
            @test length(graph.end_node) == length(graph.edges)
        end
    end

    @testset "assignment" begin
        folder = "data/networks/assignment"
        for fname in readdir(folder)
            file = joinpath(folder, fname)
            graph = read_graph(file, "assignment")
            data, header = readdlm(file, '\t', Int64, header=true)
            @test length(graph.edges) == size(data, 1)
            @test length(graph.first_out) == length(graph.nodes) + 1
            @test length(graph.end_node) == length(graph.edges)
        end
    end

end
