include("src/read.jl")
include("src/gils.jl")

function main()
    data = readInstance(ARGS[1])
    solution = GILS(data, 50)

    println("\nTime = ", solution.time)
    println("Route = ", solution.route)

    return 0
end

main()