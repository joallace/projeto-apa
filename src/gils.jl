include("structs.jl")
include("construction.jl")
include("neighborhood_movements.jl")
include("neighborhood_descents.jl")
include("util.jl")

# A function that perturbs the solution using the Double-bridge method
function perturb!(s::Solution{T}, dimension::Int, matrix::Matrix{T}) where {T}
    i_size = rand(1:ceil(Int, dimension/10))
    j_size = rand(1:ceil(Int, dimension/10))

    i = rand(2:(length(s.route) - (i_size+j_size+2)))
    i_f = i+i_size

    j = rand(i_f+1:(length(s.route) - (j_size+1)))
    j_f = j+j_size

    sub_route1 = s.route[i:i_f]
    sub_route2 = s.route[j:j_f]

    s.time -= matrix[s.route[i-1], s.route[i]] +
              matrix[s.route[i_f], s.route[i_f+1]] +
              ((i_f+1 == j) ? 0 : matrix[s.route[j-1], s.route[j]]) +   #Checks if the subsequences are adjacent
              matrix[s.route[j_f], s.route[j_f+1]]

    deleteat!(s.route, j:j_f)
    deleteat!(s.route, i:i_f)
    splice!(s.route, i:1, sub_route2)
    splice!(s.route, j+(j_size-i_size):1, sub_route1)

    s.time += matrix[s.route[i-1], s.route[i]] +
              matrix[s.route[i+j_size], s.route[i+j_size+1]] +
              ((i_f+1 == j) ? 0 : matrix[s.route[j + (j_size-i_size)-1], s.route[j + (j_size-i_size)]]) +
              matrix[s.route[j_f], s.route[j_f+1]]
end


function GILS(data::Data{T}, i_max::Int) where {T}
    final = Solution{T}(Int[], typemax(T))
    best = Solution{T}(Int[], typemax(T))

    i_ils = data.dimension>=150 ? ceil(Int, data.dimension/2) : data.dimension
    neighbor_list = Function[swap!, revert!, reinsert1!, reinsert2!, reinsert3!]

    for _ in 1:i_max
        s = construction(rand(Float32), data.dimension, data.matrix)
        best.time = typemax(T)

        for i in 1:i_ils
            RVND!(s, data.matrix, neighbor_list)

            if s.time < best.time
                best = copy(s)
                i = 1
            else
                s = copy(best)
            end

            perturb!(s, data.dimension, data.matrix)
        end

        if best.time < final.time
            final = copy(best)
            println("New minimum: ", final.time)
        end
    end

    return final
end