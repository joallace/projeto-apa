include("structs.jl")

# function inter_swap!(s::Solution{T}, matrix::Matrix{T}) where {T}
#     best = Move(0, 0, typemax(T))

#     # Repeating until the swap with lowest delta is found
    
#     for route in 1:length(s.routes)
            
#         for i in 2:length(s.routes[rid])-2
#             rm_delta = -matrix[s.routes[rid][i-1], s.routes[rid][i]] -
#                         matrix[s.routes[rid][i], s.routes[rid][i+1]]
#             for j in i+2:length(s.routes[rid])-1
#                 delta = rm_delta +
#                         matrix[s.routes[rid][j-1], s.routes[rid][i]] +
#                         matrix[s.routes[rid][i], s.routes[rid][j+1]] +
#                         matrix[s.routes[rid][i-1], s.routes[rid][j]] +
#                         matrix[s.routes[rid][j], s.routes[rid][i+1]] -
#                         matrix[s.routes[rid][j-1], s.routes[rid][j]] -
#                         matrix[s.routes[rid][j], s.routes[rid][j+1]]
                
#                 if delta < 0 && delta < best.time
#                     best = Move(i, j, delta)
#                 end
#             end
#         end

#         # Making the swap in the route and inserting the delta in the time
#         if best.time < 0
#             s.time += best.time
#             s.routes[rid][best.i], s.routes[rid][best.j] = s.routes[rid][best.j], s.routes[rid][best.i]
#             return true
#         end
#     end
#     return false
# end

function swap!(s::Solution{T}, rid::Int, matrix::Matrix{T}) where {T}
    best = Move(0, 0, typemax(T))

    # Repeating until the swap with lowest delta is found
    for i in 2:length(s.routes[rid])-2
        rm_delta = -matrix[s.routes[rid][i-1], s.routes[rid][i]] -
                    matrix[s.routes[rid][i], s.routes[rid][i+1]]
        for j in i+2:length(s.routes[rid])-1
            delta = rm_delta +
                    matrix[s.routes[rid][j-1], s.routes[rid][i]] +
                    matrix[s.routes[rid][i], s.routes[rid][j+1]] +
                    matrix[s.routes[rid][i-1], s.routes[rid][j]] +
                    matrix[s.routes[rid][j], s.routes[rid][i+1]] -
                    matrix[s.routes[rid][j-1], s.routes[rid][j]] -
                    matrix[s.routes[rid][j], s.routes[rid][j+1]]
            
            if delta < 0 && delta < best.time
                best = Move(i, j, delta)
            end
        end
    end

    # Making the swap in the route and inserting the delta in the time
    if best.time < 0
        s.time += best.time
        s.routes[rid][best.i], s.routes[rid][best.j] = s.routes[rid][best.j], s.routes[rid][best.i]
        return true
    end

    return false
end

# 2-opt, but Julia syntax won't let me name it like that, so...
function revert!(s::Solution{T}, rid::Int, matrix::Matrix{T}) where {T}
    best = Move(0, 0, typemax(T))

    for i in 2:length(s.routes[rid])-3
        for j in i+1:length(s.routes[rid])-1
            delta = matrix[s.routes[rid][i], s.routes[rid][j+1]] +
                    matrix[s.routes[rid][j], s.routes[rid][i-1]] -
                    matrix[s.routes[rid][i], s.routes[rid][i-1]] -
                    matrix[s.routes[rid][j], s.routes[rid][j+1]]
            
            if delta < 0 && delta < best.time
                best = Move(i, j, delta)
            end
        end
    end

    if best.time < 0
        s.time += best.time
        reverse!(s.routes[rid], best.i, best.j)
        return true
    end
    
    return false
end

function reinsert!(s::Solution{T}, rid::Int, matrix::Matrix{T}, num::Int) where {T}
    best = Move(0, 0, typemax(T))

    for i in 2:length(s.routes[rid])-num
        rm_delta = matrix[s.routes[rid][i-1], s.routes[rid][i+num]]-
                   matrix[s.routes[rid][i-1], s.routes[rid][i]]-
                   matrix[s.routes[rid][i+(num-1)], s.routes[rid][i+num]]
        for j in 2:length(s.routes[rid])-num
            # Checking if the j index is the same as the beginning of the subsequence
            if j != i
                if j > i
                    delta = rm_delta +
                             matrix[s.routes[rid][j+(num-1)], s.routes[rid][i]] +
                             matrix[s.routes[rid][i+(num-1)], s.routes[rid][j+num]] -
                             matrix[s.routes[rid][j+(num-1)], s.routes[rid][j+num]]
                else
                    delta = rm_delta +
                             matrix[s.routes[rid][j-1], s.routes[rid][i]] +
                             matrix[s.routes[rid][i+(num-1)], s.routes[rid][j]] -
                             matrix[s.routes[rid][j], s.routes[rid][j-1]]
                end
                
                if delta < 0 && delta < best.time
                    best = Move(i, j, delta)
                end
            end
        end
    end
            
    if best.time < 0
        i, j = min(best.i, best.j), max(best.i, best.j)+(num-1)
        s.time += best.time
        s.routes[rid][i:j] = circshift(s.routes[rid][i:j], best.i < best.j ? -num : num)
        return true
    end

    return false
end

function reinsert1!(s::Solution{T}, rid::Int, matrix::Matrix{T}) where {T}
    reinsert!(s, rid, matrix, 1)
end

function reinsert2!(s::Solution{T}, rid::Int, matrix::Matrix{T}) where {T}
    reinsert!(s, rid, matrix, 2)
end

function reinsert3!(s::Solution{T}, rid::Int, matrix::Matrix{T}) where {T}
    reinsert!(s, rid, matrix, 3)
end