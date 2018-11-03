"""
    bellman_ford(graph::Graph, source::Int)::Tuple{Vector{AbstractFloat}, Vector{Int}}

The shortest path distances using `Bellman Ford` algorithm
"""
function bellman_ford(graph::Graph, source::Int)::Tuple{Vector{AbstractFloat}, Vector{Int}}
    node_size = size(graph, 1)
    dist = ones(Float64, node_size) * Inf
    dist[source] = 0.0
    pred = ones(Int64, node_size) * -1
    for k ∈ 1:node_size-1
        for i ∈ 1:node_size
            curr_node = graph.nodes[i]
            for (neigh, edge) ∈ adj(graph, curr_node)
                t_ind = neigh.index
                weight = edge.cost
                if dist[t_ind] > dist[node_ind] + weight
                    dist[t_ind] = dist[node_ind] + weight
                    pred[t_ind] = node_ind
                end
            end
        end
    end
    return dist, pred
end
