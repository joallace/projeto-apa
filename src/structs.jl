struct Data{T <: Real}
    dimension::Int
    p::Int
    matrix::Matrix{T}
end

mutable struct Move{T}
    i::Int
    j::Int
    time::T
end

mutable struct InterMove{T}
    rid1::Int
    rid2::Int
    i::Int
    j::Int
    time::T
end

Base.@kwdef mutable struct Solution{T}
    routes::Vector{Vector{Int}} = Vector{Vector{Int}}()
    time::T = typemax(T)
end

Base.copy(x::Solution{T}) where T = Solution{T}(deepcopy(x.routes), x.time)