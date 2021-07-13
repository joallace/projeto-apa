include("neighborhood_movements.jl")

function VND!(s::Solution{T}, neighbor_list::Vector{Function}, intra_neighbor_list::Vector{Function}, p::Int, matrix::Matrix{T}) where {T}    
    for i in 1:length(neighbor_list)
        if neighbor_list[i](s, matrix, p)
            intra_VND!(s, intra_neighbor_list, matrix)
            i = 1
        end
    end
end

function intra_VND!(s::Solution{T}, neighbor_list::Vector{Function}, matrix::Matrix{T}) where {T}    
    for rid in 1:length(s.routes)
        for i in 1:length(neighbor_list)
            if neighbor_list[i](s, rid, matrix)
                i = 1
            end
        end
    end
end

<<<<<<< HEAD
function RVND!(s::Solution{T}, default_neighbor_list::Vector{Function}, intra_neighbor_list::Vector{Function}, p::Int, matrix::Matrix{T}) where {T}
    neighbor_list = copy(default_neighbor_list)
    
    while !isempty(neighbor_list)
        i = rand(1:length(neighbor_list))

        if !neighbor_list[i](s, matrix, p)
=======
function RVND!(s::Solution{T}, default_neighbor_list::Vector{Function}, intra_neighbor_list::Vector{Function}, matrix::Matrix{T}) where {T}    

    neighbor_list = copy(default_neighbor_list)
    while !isempty(neighbor_list)
        i = rand(1:length(neighbor_list))

        if !neighbor_list[i](s, matrix)
>>>>>>> d5a66fc6747d8b2031e81b77e466152e970aa2d7
            deleteat!(neighbor_list, i)
        elseif length(neighbor_list) != length(default_neighbor_list)
            intra_RVND!(s, intra_neighbor_list, matrix)
            neighbor_list = copy(default_neighbor_list)
        end
    end
end

# refatorar pra inter rota
function intra_RVND!(s::Solution{T}, default_neighbor_list::Vector{Function}, matrix::Matrix{T}) where {T}
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