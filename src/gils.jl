include("structs.jl")
include("construction.jl")
include("neighborhood_movements.jl")
include("neighborhood_descents.jl")

# A function that perturbs the solution using the Double-bridge method
function perturb!(s::Solution{T}, dimension::Int, matrix::Matrix{T}) where {T}
    i_size = rand(1:ceil(dimension/10)-1)
    j_size = rand(1:ceil(dimension/10)-1)

    i = rand(1:(dimension - (i_size+j_size+2)))
    j = rand(1:(dimension - (i+i_size+j_size+1) + (i+i_size)))

    sub_route1 = view(s.route, i:i+i_size)
    sub_route2 = view(s.route, j:j+j_size)

    s.cost -= matrix[s.route[i-1]][s.route[i]] +
              matrix[s.route[i+i_size]][s.route[i+i_size+1]] +
              ((i+i_size+1 == j) ? 0 : matrix[s.route[j-1]][s.route[j]]) +   #Checks if the subsequences are adjacent
              matrix[s.route[j+j_size]][s.route[j+j_size+1]]

    deleteat!(s.route, j:j+j_size)
    deleteat!(s.route, i:i+i_size)
    insert!(s.route, i, sub_route2)
    insert!(s.route, j + (j_size-i_size), sub_route1)

    s.cost += matrix[s.route[i-1]][s.route[i]] +
              matrix[s.route[i+j_size]][s.route[i+j_size+1]] +
              ((i+i_size+1 == j) ? 0 : matrix[s.route[j + (j_size-i_size)-1]][s.route[j + (j_size-i_size)]]) +
              matrix[s.route[j+j_size]][s.route[j+j_size+1]]
end


function GILS(data::Data{T}, i_max::Int) where {T}
    final = Solution{T}(time = typemax(T))
    best = Solution{T}(time = typemax(T))

    i_ils = data.dimension>=150 ? data.dimension/2 : data.dimension
    neighbor_list = Function[swap!, revert!, reinsert1!, reinsert2!, reinsert3!]

    for _ in 1:i_max
        s = construction(rand(Float32), data.dimension, data.matrix)
        best.time = typemax(T)

        for i in 1:i_ils
            RVND!(s, data.matrix, neighbor_list)

            if s.time < best.time
                i = 0
                best = s
            else
                s = best
            end

            perturb!(s, data.dimension, data.matrix)
        end

        if best.time < final.time
            final = best
            println("New minimum: ", final.time)
        end
    end

    return final
end