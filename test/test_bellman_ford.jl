@testset "bellman_ford" begin

    @testset "small_network" begin
        file = "data/networks/distance/weighted_elist_small.txt"
        graph = read_graph(file, "distance")
        distances, pred = bellman_ford(graph, 1)
        @test distances[5] == 36.0
        @test distances[10] == 19.0
    end

    @testset "large_network" begin
        file = "data/networks/distance/weighted_elist_large.txt"
        graph = read_graph(file, "distance")
        distances, pred = bellman_ford(graph, 1)
        @test distances[130] == 49.0
        @test distances[180] == 25.0
        @test distances[200] == 46.0
    end

    @testset "vlarge_network" begin
        file = "data/networks/distance/weighted_elist_vlarge.txt"
        graph = read_graph(file, "distance")
        distances, pred = bellman_ford(graph, 1)
        @test distances[250] == 19.0
        @test distances[1000] == 20.0
        @test distances[1500] == 16.0
    end

end
