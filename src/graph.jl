"""
    Graph{T}

    A type representing an undirected graph
"""

struct Node
    supply::Integer
    demand::Integer
end

struct Edge
    cost::Integer
    capacty::Integer
end


function Graph{T}(n::Integer=0) where T <: Integer
    nodes = [Nodes]
end
