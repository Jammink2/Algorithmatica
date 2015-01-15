def euc_2d(c1, c2)
end

def cost(permutation, cities)
end

def random_permutation(cities)
end

def initialise_pheromone_matrix(num_cities, init_pher)
end

def calculate_choices(cities, last_city, exclude, pheromone, c_heur, c_hist)
end

def prob_select(choices)
end

def greedy_select(choices)
end

def stepwise_const(cities, phero, c_heur, c_greed)
end

def global_update_pheromone(phero, cand, decay)
end


def local_update_pheromone(pheromone, cand, c_local_phero, init_phero)
end

def search(cities, max_it, num_ants, decay, c_heur, c_local_phero, c_greed)
    
end

if __FILE__ ==$0
    # problem configuration
    berlin52 = [[565,575],[25,185],[345,750],[945,685],[845,655],
[880,660],[25,230],[525,1000],[580,1175],[650,1130],[1605,620],
[1220,580],[1465,200],[1530,5],[845,680],[725,370],[145,665],
[415,635],[510,875],[560,365],[300,465],[520,585],[480,415],
[835,625],[975,580],[1215,245],[1320,315],[1250,400],[660,180],
[410,250],[420,555],[575,665],[1150,1160],[700,580],[685,595],
[685,610],[770,610],[795,645],[720,635],[760,650],[475,960],
[95,260],[875,920],[700,500],[555,815],[830,485],[1170,65],
[830,610],[605,625],[595,360],[1340,725],[1740,245]]
    # algorithm configuration
    max_it = 100
    num_ants = 10
    decay = 0.1
    c_heur = 2.5
    c_local_phero = 0.1
    c_greed = 0.9
    # execute the algorithm
    best = search(berlin52, max_it, num_ants, decay, c_heur, c_local_phero, c_greed)
    puts "Done.  Best Solution: c=#{best[:cost]}, v=#{best[:vector].inspect}"
end
