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

Base.@kwdef mutable struct Solution{T}
    route::Vector{Int} = Int[]
    time::T = zero(T)
end