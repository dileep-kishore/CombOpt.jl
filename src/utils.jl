"""
    read_graph(fname::String, format::String, delim::AbstractChar='')

Reads in a delimited file with 3 columns into a `Graph` struct
"""
function read_graph(fname::String, format::String; delim::AbstractChar='\t')::Graph
    data, header = readdlm(fname, delim, Int64, header=true)
    n_nodes, n_edges, = map(x -> parse(Int64, x), header)
    @assert n_edges == size(data, 1) "Edge numbers don't match"
    nodes = map(x -> Node(x, 0, 0), 1:n_nodes)
    sorted_data = sortslices(data, dims = 1)
    first_out, end_node = forward_star(n_nodes, sorted_data[:, 1:2])
    if format == "simple"
        edges = map(x -> Edge(x[1], 0, 0), 1:n_edges)
    elseif format == "distance"
        edges = map(x -> Edge(x[1], x[2], 0), zip(1:n_edges, sorted_data[:, 3]))
    elseif format == "capacity"
        edges = map(x -> Edge(x[1], 0, x[2]), zip(1:n_edges, sorted_data[:, 3]))
    elseif format == "assignment"
        edges = map(x -> Edge(x[1], x[2], 0), zip(1:n_edges, sorted_data[:, 3]))
    else
        throw(ArgumentError("Unsupported format. Use either distance, capacity or assignment"))
    end
    @assert length(first_out) == length(nodes) + 1 "forward_star failed"
    @assert length(end_node) == length(edges) "forward_star failed"
    return Graph(nodes, edges, first_out, end_node)
end
