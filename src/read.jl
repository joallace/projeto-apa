include("structs.jl")

function readInstance(filePath::String)
    open(filePath) do file
        data_vec = Vector{Int}[]
        dimension = parse(Int, split(readline(file))[2])
        p = parse(Int, split(readline(file))[2])

        # Ignoring useless line
        readline(file)

        for line in eachline(file)
            push!(data_vec, map(x->parse(Int, x), split(line)))
        end

        return Data(dimension, p, Matrix(transpose(reshape(vcat(data_vec...), dimension, :))))
    end
end
