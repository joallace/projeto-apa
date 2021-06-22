include("structs.jl")
include("neighborhood_movements.jl")
include("neighborhood_descents.jl")
include("construction.jl")

function GILS(data::Data{T}) where {T}
    final = Solution{T}(time = typemax(T))
    best = Solution{T}(time = typemax(T))
    neighbor_list = Function[swap!, revert!, reinsert1!, reinsert2!, reinsert3!]

    i_ils = data.dimension>=150 ? data.dimension/2 : data.dimension

    for _ in 1:i_max
        s = construction(rand(Float32), data.dimension, data.matrix)
        best.time = typemax(T)

        for i in 1:i_ils
            s = RVND!(s, data.matrix, neighbor_list)

            if s.time < best.time
                i = 0
                best = s
            else
                s = best
            end

            perturb()
        end

        if best.time < final.time
            final = best
            println("New minimum: ", final.time)
        end
    end

    return final
end