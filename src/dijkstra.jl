#= function dijkstra(first_out::Array{Int64, 1}, end_node::Array{Int64, 1}, weights::Array{Int64, 1})::Dict{Int64, Array{Int64, 1}} =#
function dijkstra(graph::Graph, source::Int64, target::Int64)
    # TODO: Build the `Graph` datastructure
    node_size = size(first_out) - 1
    dist = ones(Float64, node_size) * Inf
    dist[1] = 0.0
    Q = Set{Int64}()  # visited nodes
    T = Set{Int64}(1:node_size)  # unvisited nodes
    pred = ones(Int64, node_size) * -1
    adj = []
    for (ind, (s, e)) in enumerate(zip(first_out[1:end-1], first_out[2:end]))
        push!(adj, end_node[s:e-1])
    while target ∉ Q
        # node selection
        i = argmin([d for k, d in enumerate(dist) if k in T])
        push!(Q, i)
        delete!(T, i)
        # distance update
        for target in adj[i]
            if dist[target] > dist[i] + weights[i, target]
                dist[target] = dist[i] + weights[i, target]
                pred[target] = i
            end
        end
    end
end
