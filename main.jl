include("src/read.jl")
include("src/gils.jl")
include("src/neighborhood_descents.jl")
include("src/neighborhood_movements.jl")
include("src/util.jl")

function printHelp()
    print(
            """
            usage: julia [-t NUM_THREADS] main.jl <instance path> <algorithm>

            Optional arguments:
            └ t \t To run with more than 1 thread, specify the number of threads

            The algorithm options are:
            | 1 \t GILS-RVND
            | 2 \t VND
            | 3 \t RVND
            └ 4 \t Construction Heuristic
            """
        )
end

function main()
    if length(ARGS) == 1 && (ARGS[1] == "-h" || ARGS[1] == "--help")
        printHelp()
        return
    end

    if length(ARGS) != 2
        printstyled("ERROR:"; color=:red)
        println(" Invalid parameters, use -h or --help")
        return
    end    

    data = readInstance(ARGS[1])
    neighbor_list = Function[swap11!, swap22!, swap21!, swap33!, cross!, shift1!, shift2!, shift3!]
    intra_neighbor_list = Function[swap!, revert!, reinsert1!, reinsert2!, reinsert3!]
    
    choice = parse(Int64, ARGS[2])
    
    if choice == 1
        solution = GILS(100, neighbor_list, intra_neighbor_list, data)
    elseif choice <= 0 || choice > 4
        printstyled("ERROR:"; color=:red)
        println(" Invalid algorithm")
        printHelp()
        return
    else
        solution = construction(rand(Float32), data.p, data.dimension, data.matrix) #choice 4
        if ARGS[2] == 2
            VND!(solution, neighbor_list, intra_neighbor_list, data.p, data.matrix)
        elseif ARGS[2] == 3
            RVND!(solution, neighbor_list, intra_neighbor_list, data.p, data.matrix)
        end
    end

    println("\nTime = ", solution.time, " (", getRealCost(solution, data.matrix), ")")
    print("Route = ")
    printCup(solution.routes)
end

main()