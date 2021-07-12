include("neighborhood_movements.jl")

function VND!(s::Solution{T}, neighbor_list::Vector{Function}, matrix::Matrix{T}) where {T}    
    for rid in 1:length(s.routes)
        for i in 1:length(neighbor_list)
            if neighbor_list[i](s, rid, matrix)
                i = 1
            end
        end
    end
end

# refatorar pra inter rota
function RVND!(s::Solution{T}, default_neighbor_list::Vector{Function}, matrix::Matrix{T}) where {T}
    for rid in 1:length(s.routes)
        neighbor_list = copy(default_neighbor_list)
        
        while !isempty(neighbor_list)
            i = rand(1:length(neighbor_list))

            if !neighbor_list[i](s, rid, matrix)
                deleteat!(neighbor_list, i)
            elseif length(neighbor_list) != length(default_neighbor_list)
                neighbor_list = copy(default_neighbor_list)
            end
        end
    end
end