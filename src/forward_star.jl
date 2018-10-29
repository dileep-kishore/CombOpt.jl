"""
    forward_star(n_nodes::Int64, edge_list::Array{Int64, 2})

Creates the forward star representation of the input edge list
"""
function forward_star(n_nodes::Int64, edge_list::Array{Int64, 2})::Tuple{Array{Int64, 1}, Array{Int64, 1}}
    first_out = ones(Int64, n_nodes + 1)
    n_edges = size(edge_list, 1)
    end_node = zeros(Int64, n_edges)
    ind = 1
    for node in 1:n_nodes
        if ind > n_edges
            first_out[node] = ind
            continue
        end
        for i in ind:size(edge_list, 1)
            source = edge_list[i, 1]
            target = edge_list[i, 2]
            if source == node
                end_node[ind] = target
                ind += 1
            else
                first_out[node + 1] = ind
                break
            end
        end
    end
    first_out[end] = ind
    return first_out, end_node
end

# TODO: Implement reverse_star and integrate that with forward_star
