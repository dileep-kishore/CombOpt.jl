function forward_star(n_nodes::Int64, n_arcs::Int64, e_list::Array{Array{Int64, 1}, 1})::Tuple{Array{Int64, 1}, Array{Int64, 1}, Array{Int64, 1}}
    first_out = ones(Int64, n_nodes + 1)
    end_node = zeros(Int64, n_arcs)
    weights = zeros(Int64, n_arcs)
    ind = 1
    if len(e_list[1]) > 2
        weighted = true
    else
        weighted = false
    end
    for node in 1:n_nodes
        if ind > n_arcs
            first_out[node] = ind
        end
        for (i, edge) in enumerate(e_list[ind:end])
            if edge[1] == node
                end_node[ind] = edge[2]
                if weighted
                    weight[ind] = edge[3]
                end
                ind += 1
            else
                first_out[node + 1] = ind
                break
            end
        end
    end
    first_out[end] = ind
    return first_out, end_node, weights
end
