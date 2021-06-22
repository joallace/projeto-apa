include("src/read.jl")
include("src/gils.jl")

function main()
    data = readInstance(ARGS[1])
    display(data.matrix)
    println()
    solution = GILS(data, 50)

    println(solution)

    return 0
end

main()