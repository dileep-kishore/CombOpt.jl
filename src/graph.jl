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
    capacty::T
end
end


function Graph{T}(n::Integer=0) where T <: Integer
    nodes = [Nodes]
end
