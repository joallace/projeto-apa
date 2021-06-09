struct Data
    dimension::Int
    p::Int
    matrix::Matrix{Int}
end

function read_instance(filePath::String)
    open(filePath) do file
        dataVec = Vector{Int}[]
        dimension = parse(Int, split(readline(file))[2])
        p = parse(Int, split(readline(file))[2])

        # Ignoring useless line
        readline(file)
        
        for line in eachline(file)
            push!(dataVec, map(x->parse(Int, x), split(line)))
        end

        return Data(dimension, p, transpose(reshape(vcat(dataVec...), dimension, :)))
    end

end
