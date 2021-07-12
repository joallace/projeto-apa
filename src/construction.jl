include("structs.jl")

function subtours!(candidate_list::Vector{Int}, subtour_size::Int, n_routes::Int, matrix::Matrix{T}) where {T}
    # Obtaining an initial item randomly
    s = Solution{T}(time = zero(T))

    for _ in 1:n_routes
        # Inserting it into the solution and removing it from the candidate list
        push!(s.routes, Int[1])

        # Inserting random items from the candidate list into the solution
        for i in 1:subtour_size
            j = rand(1:length(candidate_list))
            s.time += matrix[s.routes[end][i], candidate_list[j]]
            push!(s.routes[end], candidate_list[j])
            deleteat!(candidate_list, j)
        end

        # Finishing the Hamiltonian cycle
        push!(s.routes[end], 1)
        s.time += matrix[s.routes[end][end-1], s.routes[end][end]]
    end

    return s
end

function construction(α::AbstractFloat, p::Int, dimension::Int, matrix::Matrix{T}) where {T}
    # Filling up the candidate list
    candidate_list = Int[]
    for candidate in 2:dimension
        push!(candidate_list, candidate)
    end

    n_routes = ceil(Int, (dimension-1)/p)
    s = subtours!(candidate_list, 3, n_routes, matrix)
    
    # Repeating until a feasible initial solution is found
    while !isempty(candidate_list)
        for route in 1:n_routes
            for _ in 3:p
                # Calculating the insertion cost of each one of the remaining candidates
                time_vector = Move{T}[]

                for i in 1:length(s.routes[route])-1, j in 1:length(candidate_list)
                    push!(time_vector, Move(j, i,
                    matrix[s.routes[route][i], candidate_list[j]] 
                    + matrix[candidate_list[j], s.routes[route][i+1]] 
                        - matrix[s.routes[route][i], s.routes[route][i+1]]))
                end
            
                sort!(time_vector, by = x -> x.time)
                
                # Obtaining an item at a random index of the time_vector
                next_node = ceil(Int, rand(1:length(time_vector)) * α)

                # Inserting the item into the solution and removing it from the candidate list
                insert!(s.route, time_vector[next_node].j+1, candidate_list[time_vector[next_node].i])
                s.time += time_vector[next_node].time
                deleteat!(candidate_list, time_vector[next_node].i)
            end
        end
    end

    return s
end