"""
    Graph{T}

A type representing an undirected graph
"""

"""
    Node{T<:Int}(index::Int, supply::T, demand::T)

Defines the `Node` struct
"""
mutable struct Node{T<:Int}
    index::Int
    supply::T
    demand::T
end


"""
    Edge{T<:Int}(index::Int, cost::T, capacity::T)

Defines the `Edge` struct
"""
mutable struct Edge{T<:Int}
    index::Int
    cost::T
    capacity::T
end


"""
    Graph{T<:Int}(nodes::Vector{Node{T}}, edges::Vector{Edge{T}}, first_out::Vector{Int}, end_out::Vector{Int})

Defines the `Graph` struct
"""
struct Graph{T<:Int}
    nodes::Vector{Node{T}}
    edges::Vector{Edge{T}}
    first_out::Vector{Int}
    end_node::Vector{Int}
end


"""
    adj(graph::Graph, node::Node)

Returns a `Vector` of pairs of (`Node`, `Edge`)
"""
function adj(graph::Graph, node::Node)::Vector{Tuple{Node, Edge}}
    node_ind = node.index
    edge_start_ind = graph.first_out[node_ind]
    edge_end_ind = graph.first_out[node_ind + 1]
    end_nodes = graph.end_node[edge_start_ind:edge_end_ind-1]
    nodes = graph.nodes[end_nodes]
    edges = graph.edges[edge_start_ind:edge_end_ind-1]
    return collect(zip(nodes, edges))
end


"""
    size(graph::Graph, dim::Integer)::Integer

Returns the size of the graph along the 'dims'
Where, 'dims' can be one of 1 == nodes and 2 == edges
"""
function Base.size(graph::Graph, dim::Integer)::Integer
    if dim == 1
        return size(graph.nodes, 1)
    elseif dim == 2
        return size(graph.edges, 1)
    else
        throw(ArgumentError("dims can only be either 1 (nodes) or 2 (edges)"))
    end
end

"""
    path(pred::Vector{Int64}, target::Int64, source::Int64)::Vector{Int64}

Returns the path from source to target given the `Vector` of predecessors
"""
function path(pred::Vector{Int64}, target::Int64, source::Int64)::Vector{Int64}
    path_arr = Vector{Int64}([target])
    x = target
    while x != source
        y = pred[x]
        push!(path_arr, y)
        x = y
    end
    return reverse(path_arr)
end
