"""
    dijkstra(graph::Graph, source::Int)::Dict{Int, Int}

The shortest path distances using `Dijkstra's` algorithm
"""
function dijkstra(graph::Graph, source::Int64)::Array{Float64, 1}
    node_size = size(graph.first_out) - 1
    dist = ones(Float64, node_size) * Inf
    dist[1] = 0.0
    Q = Set{Int64}()  # visited nodes
    T = Set{Int64}(1:node_size)  # unvisited nodes
    pred = ones(Int64, node_size) * -1
    while target ∉ Q
        # node selection
        i = argmin([d for k, d in enumerate(dist) if k in T])
        push!(Q, i)
        delete!(T, i)
        # distance update
        for target in adj(graph, graph.nodes[i])
            t_ind = target.index
            if dist[t_ind] > dist[i] + weights[i, t_ind]
                dist[t_ind] = dist[i] + weights[i, t_ind]
                pred[t_ind] = i
            end
        end
    end
    return dist
end
