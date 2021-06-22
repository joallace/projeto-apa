include("structs.jl")

function subtour!(candidate_list::Vector{Int}, dimension::Int, matrix::Matrix{T}) where {T}
    # Obtaining an initial item randomly
    s = Solution{T}()
    first = random(1:dimension)

    # Inserting it into the solution and removing it from the candidate list
    push!(s.route, first)
    deleteat!(candidate_list, first)

    # Inserting random items from the candidate list into the solution
    for i in 1:subtour_size
        j = rand(1:length(candidate_list))
        s.time += matrix[s.route[i]][candidate_list[j]]
        push!(s.route, candidate_list[j])
        deleteat!(candidate_list, j)
    end

    # Finishing the Hamiltonian cycle
    push!(s.route, first)
    s.time += matrix[s.route[subtour_size]][s.route[subtour_size+1]]

    return s
end

function construction(α::AbstractFloat, dimension::Int, matrix::Matrix{T}) where {T}
    # Filling up the candidate list
    candidate_list = Int[]
    for candidate in 1:data.dimension
        push!(candidate_list, candidate)
    
    s = subtour!(candidate_list, dimension, matrix)

    # Repeating until a feasible initial solution is found
    while !isempty(candidate_list)
        # Calculating the insertion cost of each one of the remaining candidates
        # time_vector = Vector{Move{T}}[]
        time_vector = Vector{Move{T}}(undef, (length(s.route)-2) * length(candidate_list))

        k = 0
        for i in 2:length(s.route)-1, j in 1:length(candidate_list)
            # Assigning the indexes to the node members
            time_vector[k].i = j
            time_vector[k].j = i

            # Calculating the insertion cost and inserting the node into the vector
            time_vector[k].time =  matrix[s.route[i]][candidate_list[j]] 
                                  +matrix[candidate_list[j]][s.route[i+1]]
                                  -matrix[s.route[i]][s.route[i+1]]

            k+=1
        end
    
        sort!(time_vector, by = x -> x.time)
        
        # Obtaining an item in a random interval of the time_vector
        next_node = rand(1:((length(s.route)-2) * length(candidate_list) - 1)) * α

        # Inserting the item into the solution and removing it from the candidate list
        insert!(s.route, time_vector[next_node].j, candidate_list[time_vector[next_node].i])
        deleteat!(candidate_list, time_vector[next_node].i)
        s.time += time_vector[next_node].time
    end

    return s
end