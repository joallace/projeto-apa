include("structs.jl")

function inter_swap11!(s::Solution{T}, matrix::Matrix{T}, p::Int) where {T}
    best = InterMove(0, 0, 0, 0, typemax(T))

    for rid1 in 1:length(s.routes)
        for rid2 in rid1+1:length(s.routes)

            # Repeating until the swap with lowest delta is found
            for i in 2:length(s.routes[rid1])-1
                rm_delta = -matrix[s.routes[rid1][i-1], s.routes[rid1][i]] -
                            matrix[s.routes[rid1][i], s.routes[rid1][i+1]]
                for j in 2:length(s.routes[rid2])-1
                    delta = rm_delta +
                            matrix[s.routes[rid2][j-1], s.routes[rid1][i]] +
                            matrix[s.routes[rid1][i], s.routes[rid2][j+1]] +
                            matrix[s.routes[rid1][i-1], s.routes[rid2][j]] +
                            matrix[s.routes[rid2][j], s.routes[rid1][i+1]] -
                            matrix[s.routes[rid2][j-1], s.routes[rid2][j]] -
                            matrix[s.routes[rid2][j], s.routes[rid2][j+1]]
                    
                    if delta < 0 && delta < best.time
                        best = InterMove(rid1, rid2, i, j, delta)
                    end
                end
            end
        end
    end
    
    # Making the swap in the route and inserting the delta in the time
    if best.time < 0
        s.time += best.time
        s.routes[best.rid1][best.i], s.routes[best.rid2][best.j] = s.routes[best.rid2][best.j], s.routes[best.rid1][best.i]
        return true
    end
    return false
end

function inter_swap21!(s::Solution{T}, matrix::Matrix{T}, p::Int) where {T}
    best = InterMove(0, 0, 0, 0, typemax(T))

    for rid1 in 1:length(s.routes)
        for rid2 in 1:length(s.routes)
            rid1 == rid2 && continue
            
            # Repeating until the swap with lowest delta is found
            for i in 2:length(s.routes[rid1])-2
                rm_delta = -matrix[s.routes[rid1][i-1], s.routes[rid1][i]] -           # because we need the previous
                            matrix[s.routes[rid1][i+1], s.routes[rid1][i+2]] # before were the cut was made: i + (num1-1) 
                for j in 2:length(s.routes[rid2])-1
                    if length(s.routes[rid2])+1 >= p+2
                        #Doesn't need to check s.routes[rid1] because the swap always reduce or maintain its size
                        break
                    end
                    delta = rm_delta +
                            matrix[s.routes[rid2][j-1], s.routes[rid1][i]] +
                            matrix[s.routes[rid1][i+1], s.routes[rid2][j+1]] +
                            matrix[s.routes[rid1][i-1], s.routes[rid2][j]] +
                            matrix[s.routes[rid2][j], s.routes[rid1][i+2]] -
                            matrix[s.routes[rid2][j-1], s.routes[rid2][j]] -
                            matrix[s.routes[rid2][j], s.routes[rid2][j+1]]
                    
                    if delta < 0 && delta < best.time
                        best = InterMove(rid1, rid2, i, j, delta)
                    end
                end
            end
        end
    end
    
    # Making the swap in the route and inserting the delta in the time
    if best.time < 0
        s.time += best.time
        s.routes[best.rid1], s.routes[best.rid2] = vcat(s.routes[best.rid1][1:best.i-1], s.routes[best.rid2][best.j:best.j], s.routes[best.rid1][best.i+2:end]), vcat(s.routes[best.rid2][1:best.j-1], s.routes[best.rid1][best.i:best.i+1], s.routes[best.rid2][best.j+1:end])
        return true
    end
    return false
end

function inter_swap22!(s::Solution{T}, matrix::Matrix{T}, p::Int) where {T}
    best = InterMove(0, 0, 0, 0, typemax(T))

    for rid1 in 1:length(s.routes)
        for rid2 in rid1+1:length(s.routes)
            
            # Repeating until the swap with lowest delta is found
            for i in 2:length(s.routes[rid1])-2
                rm_delta = -matrix[s.routes[rid1][i-1], s.routes[rid1][i]] -           # because we need the previous
                            matrix[s.routes[rid1][i+1], s.routes[rid1][i+2]] # before were the cut was made: i + (num1-1) 
                for j in 2:length(s.routes[rid2])-2
                    delta = rm_delta +
                            matrix[s.routes[rid2][j-1], s.routes[rid1][i]] +
                            matrix[s.routes[rid1][i+1], s.routes[rid2][j+2]] +
                            matrix[s.routes[rid1][i-1], s.routes[rid2][j]] +
                            matrix[s.routes[rid2][j+1], s.routes[rid1][i+2]] -
                            matrix[s.routes[rid2][j-1], s.routes[rid2][j]] -
                            matrix[s.routes[rid2][j+1], s.routes[rid2][j+2]]
                    
                    if delta < 0 && delta < best.time
                        best = InterMove(rid1, rid2, i, j, delta)
                    end
                end
            end
        end
    end
    
    # Making the swap in the route and inserting the delta in the time
    if best.time < 0
        s.time += best.time
        #s.routes[best.rid1], s.routes[best.rid2] = vcat(s.routes[best.rid1][1:best.i-1], s.routes[best.rid2][best.j:best.j+1], s.routes[best.rid1][best.i+2:end]), vcat(s.routes[best.rid2][1:best.j-1], s.routes[best.rid1][best.i:best.i+1], s.routes[best.rid2][best.j+2:end])
        s.routes[best.rid1][best.i:best.i+1], s.routes[best.rid2][best.j:best.j+1] = s.routes[best.rid2][best.j:best.j+1], s.routes[best.rid1][best.i:best.i+1]
        return true
    end
    return false
end

function inter_swap33!(s::Solution{T}, matrix::Matrix{T}, p::Int) where {T}
    best = InterMove(0, 0, 0, 0, typemax(T))

    for rid1 in 1:length(s.routes)
        for rid2 in rid1+1:length(s.routes)
            
            # Repeating until the swap with lowest delta is found
            for i in 2:length(s.routes[rid1])-3
                rm_delta = -matrix[s.routes[rid1][i-1], s.routes[rid1][i]] -           # because we need the previous
                            matrix[s.routes[rid1][i+2], s.routes[rid1][i+3]] # before were the cut was made: i + (num1-1) 
                for j in 2:length(s.routes[rid2])-3
                    delta = rm_delta +
                            matrix[s.routes[rid2][j-1], s.routes[rid1][i]] +
                            matrix[s.routes[rid1][i+2], s.routes[rid2][j+3]] +
                            matrix[s.routes[rid1][i-1], s.routes[rid2][j]] +
                            matrix[s.routes[rid2][j+2], s.routes[rid1][i+3]] -
                            matrix[s.routes[rid2][j-1], s.routes[rid2][j]] -
                            matrix[s.routes[rid2][j+2], s.routes[rid2][j+3]]
                    
                    if delta < 0 && delta < best.time
                        best = InterMove(rid1, rid2, i, j, delta)
                    end
                end
            end
        end
    end
    
    # Making the swap in the route and inserting the delta in the time
    if best.time < 0
        s.time += best.time
        #s.routes[best.rid1], s.routes[best.rid2] = vcat(s.routes[best.rid1][1:best.i-1], s.routes[best.rid2][best.j:best.j+1], s.routes[best.rid1][best.i+2:end]), vcat(s.routes[best.rid2][1:best.j-1], s.routes[best.rid1][best.i:best.i+1], s.routes[best.rid2][best.j+2:end])
        s.routes[best.rid1][best.i:best.i+2], s.routes[best.rid2][best.j:best.j+2] = s.routes[best.rid2][best.j:best.j+2], s.routes[best.rid1][best.i:best.i+2]
        return true
    end
    return false
end

function shift!(s::Solution{T}, matrix::Matrix{T}, p::Int, num::Int) where {T}
    best = InterMove(0, 0, 0, 0, typemax(T))

    for rid1 in 1:length(s.routes)-1
        for rid2 in 1:length(s.routes)-1
            if length(s.routes[rid2])+num >= p+2 || rid1==rid2
                continue
            end

            for i in 2:length(s.routes[rid1])-num
                rm_delta = matrix[s.routes[rid1][i-1], s.routes[rid1][i+num]] -
                           matrix[s.routes[rid1][i-1], s.routes[rid1][i]] -
                           matrix[s.routes[rid1][i+(num-1)], s.routes[rid1][i+num]]
                for j in 2:length(s.routes[rid2])-num
                    delta = rm_delta -
                            matrix[s.routes[rid2][j-1], s.routes[rid2][j]] +
                            matrix[s.routes[rid2][j-1], s.routes[rid1][i]] +
                            matrix[s.routes[rid1][i+(num-1)], s.routes[rid2][j]]
                    
                    if delta < 0 && delta < best.time
                        best = InterMove(rid1, rid2, i, j, delta)
                    end
                end
            end
        end
    end
            
    if best.time < 0
        s.time += best.time
        splice!(s.routes[best.rid2], best.j:0, s.routes[best.rid1][best.i : best.i+num-1])
        deleteat!(s.routes[best.rid1], best.i : best.i+num-1)
        return true
    end

    return false
end

function cross!(s::Solution{T}, matrix::Matrix{T}, p::Int) where {T}
    best = InterMove(0, 0, 0, 0, typemax(T))

    for rid1 in 1:length(s.routes)
        for rid2 in 1:length(s.routes)
            rid1 == rid2 && continue
            
            for i in 2:length(s.routes[rid1])-1
                for j in 2:length(s.routes[rid2])-1
                    if length(s.routes[rid2])-j+i >= p+2 || length(s.routes[rid1])-i+j >= p+2
                        break
                    end

                    delta = matrix[s.routes[rid1][i], s.routes[rid2][j+1]] +
                            matrix[s.routes[rid2][j], s.routes[rid1][i+1]] -
                            matrix[s.routes[rid1][i], s.routes[rid1][i+1]] -
                            matrix[s.routes[rid2][j], s.routes[rid2][j+1]]
                    
                    if delta < 0 && delta < best.time
                        best = InterMove(rid1, rid2, i, j, delta)
                    end
                end
            end
        end
    end
    
    if best.time < 0
        s.time += best.time
        s.routes[best.rid1], s.routes[best.rid2] = vcat(s.routes[best.rid1][1:best.i], s.routes[best.rid2][best.j+1:end]), vcat(s.routes[best.rid2][1:best.j], s.routes[best.rid1][best.i+1:end])
        return true
    end
    return false
end

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

function shift1!(s::Solution{T}, matrix::Matrix{T}, p::Int) where {T}
    shift!(s, matrix, p, 1)
end

function shift2!(s::Solution{T}, matrix::Matrix{T}, p::Int) where {T}
    shift!(s, matrix, p, 2)
end

function shift3!(s::Solution{T}, matrix::Matrix{T}, p::Int) where {T}
    shift!(s, matrix, p, 3)
end
