"""
    Graph{T}

    A type representing an undirected graph
"""

mutable struct Node{T}
    index::Int
    supply::T
    demand::T
end

struct Edge
    cost::Integer
    capacty::Integer
end


function Graph{T}(n::Integer=0) where T <: Integer
    nodes = [Nodes]
end
