"""
    dijkstra(graph::Graph, source::Int, target::Int)::Tuple{AbstractFloat, Vector{Int}}

The shortest path distance from `source` to `target` using `Dijkstra's` algorithm
Also returns the shortest path
"""
function dijkstra(graph::Graph, source::Int, target::Int = -1)::Tuple{AbstractFloat, Vector{Int}}
    if target > 0
        condition = x -> target ∈ x
    else
        condition = x -> !isempty(x)
    end
    dist, pred = _dijkstra_core(graph, source, condition)
    return dist[target], path(pred, target, source)
end


"""
    dijkstra(graph::Graph, source::Int)::Tuple{Vector{AbstractFloat}, Vector{Int}}

The shortest path distances from `source` to all nodes using `Dijkstra's` algorithm
Also returns the list of predecessors
"""
function dijkstra(graph::Graph, source::Int)::Tuple{Vector{AbstractFloat}, Vector{Int}}
    condition = x -> !isempty(x)
    dist, pred =  _dijkstra_core(graph, source, condition)
    return dist, pred
end


"""
    _dijkstra_core(graph::Graph, source::Int, condition::Function)::Tuple{Vector{AbstractFloat}, Vector{Int}}

The function that contains the actual implementation of the `Dijkstra's` algorithm
Please run the `dijkstra` function and not this
"""
function _dijkstra_core(graph::Graph, source::Int, condition::Function)::Tuple{Vector{AbstractFloat}, Vector{Int}}
    node_size = size(graph, 1)
    dist = ones(Float64, node_size) * Inf
    dist[source] = 0.0
    Q = Set{Int64}()  # visited nodes
    T = Set{Int64}(1:node_size)  # unvisited nodes
    pred = ones(Int64, node_size) * -1
    while condition(T)
        # node selection
        untraversed_nodes = [(d, k) for (k, d) in enumerate(dist) if k in T]
        if minimum(untraversed_nodes)[1] == Inf
            break # Break if remaining nodes are disconnected
        end
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
    return dist, pred
end
