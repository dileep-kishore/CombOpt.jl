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

Returns a `Vector` of `Node`s adjacent to the input 'node'.
"""
function adj(graph::Graph, node::Node)::Vector{Node}
    node_ind = node.index
    edge_start_ind = graph.first_out[node_ind]
    edge_end_ind = graph.first_out[node_ind + 1]
    end_nodes = graph.end_node[edge_start_ind:edge_end_ind-1]
    return graph.nodes[end_nodes]
end
