function read_elist(fname::String)::Tuple{Int64, Int64, Array{Array{Int64, 1}, 1}}
    n_nodes, n_arcs, edge_list = open(fname) do file
        counter = 1
        n_nodes = 0
        n_arcs = 0
        edge_list = Array{Int64, 1}[]
        for l in eachline(file)
            if counter == 1
                n_nodes, n_arcs = map(x -> parse(Int64, x), split(l))
            else
                a, b = split(l)
                push!(edge_list, [parse(Int64, a), parse(Int64, b)])
            end
            counter += 1
        end
        (n_nodes, n_arcs, edge_list)
    end
    sorted_elist = sort(edge_list)
    return n_nodes, n_arcs, sorted_elist
end

function read_file(fname::String, format::String)::Tuple{Int64, Int64, Array{Array{Int64, 1}, 1}}
    if format == "elist"
        return read_elist(fname)
    elseif format == "weighted elist"
        return read_weighted_elist(fname)
    else
        throw(ArgumentError("Unsupported format"))
    end
end
