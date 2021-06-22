include("neighborhood_movements.jl")
include("util.jl")

function VND!(s::Solution{T}, matrix::Matrix{T}, neighbor_list::Vector{Function}) where {T}    
    for i in 1:length(neighbor_list)
        if neighbor_list[i](s, matrix)
            i = 1
        end
    end
end

function RVND!(s::Solution{T}, matrix::Matrix{T}, default_neighbor_list::Vector{Function}) where {T}
    neighbor_list = default_neighbor_list
    
    while !isempty(neighbor_list)
        i = rand(1:length(neighbor_list))

        if getRealCost(s, matrix) != s.time
            println("[BEFORE]")
            println("Real cost = ", getRealCost(s, matrix))
            @show(s)
            println()
        end

        if !neighbor_list[i](s, matrix)
            deleteat!(neighbor_list, i)
        elseif length(neighbor_list) != length(default_neighbor_list)
            neighbor_list = default_neighbor_list
        end

        if getRealCost(s, matrix) != s.time
            println("[AFTER]")
            println("Real cost = ", getRealCost(s, matrix))
            @show(s)
            println()
        end
    end
end