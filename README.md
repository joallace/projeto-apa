# Análise e Projeto de Algoritmos - Projeto Final

Esse repositório contém o nosso projeto final da disciplina Análise e Projeto de Algoritmos(APA).

## Etapas

- [x] Implementação de pelo menos uma heurística de construção;
- [x] Implementação dos movimentos de vizinhança (Mínimo 3);
- [X] Implementação do algoritmo de busca local chamado VND (Variable Neighborhood Descent);
- [X] Implementação de uma metaheurística (OPCIONAL);
- [X] Resultados computacionais: criar uma tabela que contenha os resultados obtidos pela(s) heurística(s)
      construtiva(s) e pelo VND, e que compare tais resultados com a solução ótima de cada instância.
      
     Essa tabela deverá conter os seguintes dados para cada heurística construtiva e para o VND:
     
     * Média do valor da solução (em no mínimo 10 execuções para cada instância)
     * Melhor solução encontrada
     * Média do tempo gasto pelo respectivo algoritmo
     * GAP para a solução ótima

## Rodar o programa

* Rodando normal
```shell
julia main.jl instances/cup1.txt 1
```

* Rodando com threads
```shell
julia -t 6 main.jl instances/cup1.txt 1
```

Pode se rodar com o número que quiser, 6 foi só um exemplo.