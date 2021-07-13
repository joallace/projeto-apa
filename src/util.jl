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