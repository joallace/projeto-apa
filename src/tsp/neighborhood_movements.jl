include("structs.jl")

function swap!(s::Solution{T}, matrix::Matrix{T}) where {T}
    best = Move(0, 0, typemax(T))

    # Repeating until the swap with lowest delta is found
    for i in 2:length(s.route)-2
        rm_delta = -matrix[s.route[i-1], s.route[i]] -
                    matrix[s.route[i], s.route[i+1]]
        for j in i+2:length(s.route)-1
            delta = rm_delta +
                    matrix[s.route[j-1], s.route[i]] +
                    matrix[s.route[i], s.route[j+1]] +
                    matrix[s.route[i-1], s.route[j]] +
                    matrix[s.route[j], s.route[i+1]] -
                    matrix[s.route[j-1], s.route[j]] -
                    matrix[s.route[j], s.route[j+1]]
            
            if delta < 0 && delta < best.time
                best = Move(i, j, delta)
            end
        end
    end

    # Making the swap in the route and inserting the delta in the time
    if best.time < 0
        s.time += best.time
        s.route[best.i], s.route[best.j] = s.route[best.j], s.route[best.i]
        return true
    end

    return false
end

# 2-opt, but Julia syntax won't let me name it like that, so...
function revert!(s::Solution{T}, matrix::Matrix{T}) where {T}
    best = Move(0, 0, typemax(T))

    for i in 2:length(s.route)-3
        for j in i+1:length(s.route)-1
            delta = matrix[s.route[i], s.route[j+1]] +
                    matrix[s.route[j], s.route[i-1]] -
                    matrix[s.route[i], s.route[i-1]] -
                    matrix[s.route[j], s.route[j+1]]
            
            if delta < 0 && delta < best.time
                best = Move(i, j, delta)
            end
        end
    end

    if best.time < 0
        s.time += best.time
        reverse!(s.route, best.i, best.j)
        return true
    end
    
    return false
end

function reinsert!(s::Solution{T}, matrix::Matrix{T}, num::Int) where {T}
    best = Move(0, 0, typemax(T))

    for i in 2:length(s.route)-num
        rm_delta = matrix[s.route[i-1], s.route[i+num]]-
                   matrix[s.route[i-1], s.route[i]]-
                   matrix[s.route[i+(num-1)], s.route[i+num]]
        for j in 2:length(s.route)-num
            # Checking if the j index is the same as the beginning of the subsequence
            if j != i
                if j > i
                    delta = rm_delta +
                             matrix[s.route[j+(num-1)], s.route[i]] +
                             matrix[s.route[i+(num-1)], s.route[j+num]] -
                             matrix[s.route[j+(num-1)], s.route[j+num]]
                else
                    delta = rm_delta +
                             matrix[s.route[j-1], s.route[i]] +
                             matrix[s.route[i+(num-1)], s.route[j]] -
                             matrix[s.route[j], s.route[j-1]]
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
        s.route[i:j] = circshift(s.route[i:j], best.i < best.j ? -num : num)
        return true
    end

    return false
end

function reinsert1!(s::Solution{T}, matrix::Matrix{T}) where {T}
    reinsert!(s, matrix, 1)
end

function reinsert2!(s::Solution{T}, matrix::Matrix{T}) where {T}
    reinsert!(s, matrix, 2)
end

function reinsert3!(s::Solution{T}, matrix::Matrix{T}) where {T}
    reinsert!(s, matrix, 3)
end