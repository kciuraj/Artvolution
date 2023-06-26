% Artvolution 
% Created by: Noah Lindroth

%% 1.  Initialize parameters

num_generations = 100;  % Total number of generations
popsize = 400;         % Number of individuals in population
num_parents = 16;      % Number of parents for genetic crossover
fitness_goal = 0.95;   % Target fitness to reach

%% 2.  Initialize parameters
offspring_mutation_rate = 0.05;   % Probability of offspring mutation
chromosome_length = 12;           % Number of binary bits in each chromosome

%% 3.  Create population
population = randi([0 1],popsize,chromosome_length);

%% 4.  Evaluate fitness
fitness_scores = zeros(1,popsize);
for ii = 1:popsize
    % Fitness evaluation code
    fitness_scores(ii) = fitness_function(population(ii,:));
end

%% 5.  Create new population
for ng = 1:num_generations
    % Sort population and fitness scores by highest to lowest fitness
    [sorted_fitness,indices] = sort(fitness_scores,'descend');
    sorted_population = population(indices,:);

    % Check for termination condition
    if sorted_fitness(1) >= fitness_goal
        break;
    end

    % Keep top num_parents individuals for genetic crossover
    parents =  sorted_population(1:num_parents,:);

    % Create offspring, with random mutation
    offspring = zeros(popsize-num_parents,chromosome_length);
    for pp = 1:2:num_parents
        [offspring(pp,:),offspring(pp+1,:)] = crossover(parents(pp,:),parents(pp+1,:));
        offspring(pp,:) = mutate(offspring(pp,:),offspring_mutation_rate);
        offspring(pp+1,:) = mutate(offspring(pp+1,:),offspring_mutation_rate);
    end

    % Rebuild population
    population = [parents; offspring];

    % Evaluate fitness for new population
    for ii = 1:popsize
        % Fitness evaluation code
        fitness_scores(ii) = fitness_function(population(ii,:));
    end
end

%% 6.  Plot best individual
best_chromosome = sorted_population(1,:);
plot_best_individual(best_chromosome);

%% Functions

function f = fitness_function(indiv)
    % Fitness Function
    f = sum(indiv)/length(indiv);
end

function [off1,off2] = crossover(p1,p2)
    % Crossover function
    cross_index = randi([1 length(p1)]);
    off1 = [p1(1:cross_index) p2(cross_index+1:end)];
    off2 = [p2(1:cross_index) p1(cross_index+1:end)];
end

function off = mutate(off,mutation_rate)
    % Mutation function
    seq_length = length(off);
    mut_vec = rand(1,seq_length) < mutation_rate;
    off(mut_vec) = ~off(mut_vec);
end

function plot_best_individual(best_chromosome)
    % Plot best individual
    figure;
    plot(1:length(best_chromosome),best_chromosome);
    xlabel('Gene');
    ylabel('Value');
    title('Best Individual');
end