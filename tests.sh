for (( c=0; c<10; c++ ))
do  
   nohup time julia -t 12 main.jl instances/cup1.txt 1 >> gils_rvnd_cup1.out
   nohup time julia -t 12 main.jl instances/cup1.txt 2 >> vnd_cup1.out
   nohup time julia -t 12 main.jl instances/cup1.txt 3 >> rvnd_cup1.out
   nohup time julia -t 12 main.jl instances/cup1.txt 4 >> construction_cup1.out


   nohup time julia -t 12 main.jl instances/cup2.txt 1 >> gils_rvnd_cup2.out
   nohup time julia -t 12 main.jl instances/cup2.txt 2 >> vnd_cup2.out
   nohup time julia -t 12 main.jl instances/cup2.txt 3 >> rvnd_cup2.out
   nohup time julia -t 12 main.jl instances/cup2.txt 4 >> construction_cup2.out


   nohup time julia -t 12 main.jl instances/cup3.txt 1 >> gils_rvnd_cup3.out
   nohup time julia -t 12 main.jl instances/cup3.txt 2 >> vnd_cup3.out
   nohup time julia -t 12 main.jl instances/cup3.txt 3 >> rvnd_cup3.out
   nohup time julia -t 12 main.jl instances/cup3.txt 4 >> construction_cup3.out
done