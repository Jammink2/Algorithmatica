"""
Honey Bee Algorithm.
From Brownlee's Clever Algorithms

The purpose of this algorithm is to minimize the cost of swarming to find new nectarby picking the best sites and generally swarming first and only to those.  

The information processing objective is to locate and explore good sites within a problem search space. 

Honey bees collect nectar from flower patches as a food source for the hive.  The hive sends out scots that locate patches of flowers, who then return to the hive and inform other bees about the fitness and location of a food source bia a waggle dance.  The scout returns to the flower patch with the follower bees.  A small number of scouts continue to search for new patches, while bees returning from flower patches continue to communicate the quality of the patch.

"""
def objective_function(vector)
    return vector.inject(0.0) {|sum, x| sum + (x ** 2.0)}
end

def random_vector(minmax)
    return Array.new(minmax.size) do |i|
        minmax[i][0] + ((minmax[i][1] - minmax[i][0]) * rand())
    end
end

def create_random_bee(search_space)
    return {:vector=>random_vector(search_space)}
end

def create_neigh_bee(site, patch_size, search_space)
    vector = []
end

def search_neigh(parent, neigh_size, patch_size, search_space)
end

def create_scout_bees(search_space, num_scouts)
    return Array.new(num_scouts) do
        create_random_bee(search_space)
    end
end


def search(max_gens, search_space, num_bees, num_sites, elite_sites, patch_size, e_bees, o_bees)
    best = nil
    pop = Array.new(num_bees){ create_random_bee(search_space) }
    max_gens.times do |gen|
        pop.each{|bee| bee[:fitness] = objective_function(bee[:vector])}
        pop.sort!{|x, y| x[:fitness] <=> y[:fitness]}
        best = pop.first if best.nil? or pop.first[:fitness] < best [:fitness]
        next_gen = []
        pop[0...num_sites].each_with_index do |parent, i|
            neigh_size = (i<elite_sites) ? e_bees: o_bees
            next_gen << search_neigh(parent, neigh_size, patch_size, search_space)
        end
        scouts = create_scout_bees(search_space, (num_bees-num_sites))
        pop - next_gen + scouts
        patch_size = patch_size * 0.95
        puts " > it=#{gen+1}, patch_size=#{patch_size}, f=#{best[:fitness]}"
    end
    return best
end

if __FILE__ == $0
    # problem configuration
    problem_size = 3
    search_space = Array.new(problem_size) {|i| [-5, 5]}
    #algorithm configuration
    max_gens = 500
    num_bees = 45
    num_sites = 3
    elite_sites = 1
    patch_size = 3.0
    e_bees = 7
    o_bees = 2
    #execute the algorithm
    best = search(max_gens, search_space, num_bees, num_sites, elite_sites, patch_size, e_bees, o_bees)
    puts "done! Solution: f=#{best[:fitness]}, s=#{best[:vector].inspect}"
end
