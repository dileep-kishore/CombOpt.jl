"""
    Graph{T}

A type representing an undirected graph
"""

mutable struct Node{T}
    index::Int
    supply::T
    demand::T
end


mutable struct Edge{T}
    index::Int
    cost::T
    capacity::T
end


struct Graph{T}
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
