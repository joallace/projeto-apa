include("structs.jl")
include("construction.jl")
include("neighborhood_movements.jl")
include("neighborhood_descents.jl")
include("util.jl")

# A function that perturbs the solution using the Double-bridge method
function perturb!(s::Solution{T}, matrix::Matrix{T}) where {T}
    for rid in 1:length(s.routes)
        if length(s.routes[rid]) < 8
            continue
        end
        # print(s.routes[rid])
        i_size = rand(1:ceil(Int, (length(s.routes[rid])-1)/10))
        j_size = rand(1:ceil(Int, (length(s.routes[rid])-1)/10))

        # println(length(s.routes[rid]) - (i_size+j_size+2))
        i = rand(2:(length(s.routes[rid]) - (i_size+j_size+2)))
        i_f = i+i_size

        j = rand(i_f+1:(length(s.routes[rid]) - (j_size+1)))
        j_f = j+j_size

        sub_route1 = s.routes[rid][i:i_f]
        sub_route2 = s.routes[rid][j:j_f]

        s.time -= matrix[s.routes[rid][i-1], s.routes[rid][i]] +
                matrix[s.routes[rid][i_f], s.routes[rid][i_f+1]] +
                ((i_f+1 == j) ? 0 : matrix[s.routes[rid][j-1], s.routes[rid][j]]) +   #Checks if the subsequences are adjacent
                matrix[s.routes[rid][j_f], s.routes[rid][j_f+1]]

        deleteat!(s.routes[rid], j:j_f)
        deleteat!(s.routes[rid], i:i_f)
        splice!(s.routes[rid], i:1, sub_route2)
        splice!(s.routes[rid], j+(j_size-i_size):1, sub_route1)

        s.time += matrix[s.routes[rid][i-1], s.routes[rid][i]] +
                matrix[s.routes[rid][i+j_size], s.routes[rid][i+j_size+1]] +
                ((i_f+1 == j) ? 0 : matrix[s.routes[rid][j + (j_size-i_size)-1], s.routes[rid][j + (j_size-i_size)]]) +
                matrix[s.routes[rid][j_f], s.routes[rid][j_f+1]]
    end
end


function GILS(data::Data{T}, i_max::Int) where {T}
    final = Solution{T}()
    best = Solution{T}()

    i_ils = data.dimension>=150 ? ceil(Int, data.dimension/2) : data.dimension
    neighbor_list = Function[swap!, revert!, reinsert1!, reinsert2!, reinsert3!]

    for _ in 1:i_max
        s = construction(rand(Float32), data.p, data.dimension, data.matrix)
        best.time = typemax(T)

        for i in 1:i_ils
            VND!(s, neighbor_list, data.matrix)

            if s.time < best.time
                best = copy(s)
                i = 1
            else
                s = copy(best)
            end

            #@show s
            perturb!(s, data.matrix)
        end

        if best.time < final.time
            final = copy(best)
            println("New minimum: ", final.time)
        end
    end

    return final
end