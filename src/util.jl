function getRealCost(s::Solution{T}, matrix::Matrix{T}) where {T}
    sum = zero(T)

    for i in 1:length(s.route)-1
        sum += matrix[s.route[i], s.route[i+1]]
    end
    
    return sum
end