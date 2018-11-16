@testset "dijkstra" begin

    @testset "small_network" begin
        file = "data/networks/distance/weighted_elist_small.txt"
        graph = read_graph(file, "distance")
        distances, pred = dijkstra(graph, 1)
        @test distances[5] == 36.0
        @test distances[10] == 19.0
        dist_5, path_5 = dijkstra(graph, 1, 5)
        @test dist_5 == 36.0
        @test path_5 == [1, 12, 5]
        dist_10, path_10 = dijkstra(graph, 1, 10)
        @test dist_10 == 19.0
        @test path_10 == [1, 10]
    end

    @testset "large_network" begin
        file = "data/networks/distance/weighted_elist_large.txt"
        graph = read_graph(file, "distance")
        distances, pred = dijkstra(graph, 1)
        @test distances[130] == 49.0
        @test distances[180] == 25.0
        @test distances[200] == 46.0
        dist_130, path_130 = dijkstra(graph, 1, 130)
        @test dist_130 == 49.0
        @test path_130 == [1, 96, 30, 130]
        dist_200, path_200 = dijkstra(graph, 1, 200)
        @test dist_200 == 46.0
        @test path_200 == [1, 96, 140, 14, 200]
    end

    @testset "vlarge_network" begin
        file = "data/networks/distance/weighted_elist_vlarge.txt"
        graph = read_graph(file, "distance")
        distances, pred = dijkstra(graph, 1)
        @test distances[250] == 19.0
        @test distances[1000] == 20.0
        @test distances[1500] == 16.0
        dist_250, path_250 = dijkstra(graph, 1, 250)
        @test dist_250 == 19.0
        @test path_250 == [1, 293, 680, 139, 1439, 1109, 250]
        dist_1500, path_1500 = dijkstra(graph, 1, 1500)
        @test dist_1500 == 16.0
        @test path_1500 == [1, 293, 680, 139, 1371, 980, 1500]
    end

end
