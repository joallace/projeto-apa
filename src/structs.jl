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

mutable struct Solution{T}
    route::Vector{Int}
    time::T
end