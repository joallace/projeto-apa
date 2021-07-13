include("src/read.jl")
include("src/gils.jl")
include("src/util.jl")

function main()
    data = readInstance(ARGS[1])
    solution = GILS(data, 100)

    println("\nTime = ", solution.time, " (", getRealCost(solution, data.matrix), ")")
    println("Route = ", solution.routes)

    return 0
end

main()