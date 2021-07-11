function printTimes(times::Vector{Float64})
    println("Total time: $(times[1]) (s)")
    println("| Construction execution time: $(times[2]) (s)")
    println("| Swap execution time: $(times[3]) (s)")
    println("| 2-opt execution time: $(times[4]) (s)")
    println("| Or-opt execution time: $(times[5]) (s)")
    println("| Or-opt2 execution time: $(times[6]) (s)")
    println("| Or-opt3 execution time: $(times[7]) (s)")
end

Base.@kwdef mutable struct GILStats
    construction_seconds::Float64 = 0.0
    swap_seconds::Float64 = 0.0
    reverse_seconds::Float64 = 0.0
    reinsert_seconds::Float64 = 0.0
    reinsert2_seconds::Float64 = 0.0
    reinsert3_seconds::Float64 = 0.0
    total_seconds::Float64 = 0.0
end

function Base.show(io::IO, stats::GILStats)
    println(io)
    println(io, "┌ GILS statistics")
    println(io, "│    Construction execution time: $(times[2]) (s)")
    println(io, "│            Swap execution time: $(times[3]) (s)")
    println(io, "│           2-opt execution time: $(times[4]) (s)")
    println(io, "│          Or-opt execution time: $(times[5]) (s)")
    println(io, "│         Or-opt2 execution time: $(times[5]) (s)")
    println(io, "│         Or-opt3 execution time: $(times[5]) (s)")
    println(io, "├────────────────────────────────────────────────")
    println(io, "└                     Total time: $(times[1]) (s)")
    return
end