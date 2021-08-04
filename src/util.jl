function getRealCost(route::Vector{Int}, matrix::Matrix{T}) where {T}
    sum = zero(T)

    for i in 1:length(route)-1
        sum += matrix[route[i], route[i+1]]
    end
    
    return sum
end

function getRealCost(s::Solution{T}, matrix::Matrix{T}) where {T}
    sum = zero(T)

    for route in s.routes
        sum += getRealCost(route, matrix)
    end
    
    return sum
end

function printCup(v::Vector{Vector{Int}})
    for i in 1:length(v)
        for j in 1:length(v[i])
            v[i][j] -= 1
        end
    end
    
    print(replace(join(v, " ; "), r"[\[\]]"=>""), "\n")
end