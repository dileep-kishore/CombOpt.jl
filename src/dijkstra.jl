"""
    dijkstra(graph::Graph, source::Int, target::Int)::Tuple{Vector{AbstractFloat}, Vector{Int}}

The shortest path distances using `Dijkstra's` algorithm
"""
function dijkstra(graph::Graph, source::Int, target::Int)::Tuple{Vector{AbstractFloat}, Vector{Int}}
    node_size = size(graph, 1)
    dist = ones(Float64, node_size) * Inf
    dist[1] = 0.0
    Q = Set{Int64}()  # visited nodes
    T = Set{Int64}(1:node_size)  # unvisited nodes
    pred = ones(Int64, node_size) * -1
    while target ∉ Q
        # node selection
        untraversed_nodes = [(d, k) for (k, d) in enumerate(dist) if k in T]
        node_ind = untraversed_nodes[argmin(untraversed_nodes)][2]
        push!(Q, node_ind)
        delete!(T, node_ind)
        # distance update
        curr_node = graph.nodes[node_ind]
        for (neigh, edge) in adj(graph, curr_node)
            t_ind = neigh.index
            weight = edge.cost
            if dist[t_ind] > dist[node_ind] + weight
                dist[t_ind] = dist[node_ind] + weight
                pred[t_ind] = node_ind
            end
        end
    end
    return dist, path(pred, target, source)
end
