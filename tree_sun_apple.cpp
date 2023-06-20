#include<iostream>
#include<string>
#include<vector>

class Artvolution {
public:
    // Constructors
    Artvolution(); // Default constructor

    // Public functions
    void generate(); // Generate an Artvolution
    void randomize(); // Generate a random Artvolution
    void mutate(); // Mutate an Artvolution
    void crossover(); // Crossover two Artvolution

    // Getter methods
    std::string getName(); // Get the name of the Artvolution
    std::vector<int> getParameters(); // Get the parameters of the Artvolution
    int getFitness(); // Get the fitness of the Artvolution

private:
    std::string name; // Name of the Artvolution
    std::vector<int> parameters; // Parameters of the Artvolution
    int fitness; // Fitness of the Artvolution
    int generation; // Generation of the Artvolution

    // Private functions
    void calculateFitness(); // Calculate the fitness of the Artvolution
    void saveToFile(); // Save the Artvolution to a file
};

Artvolution::Artvolution()
    : name(""), parameters(), fitness(0), generation(0) { }

void Artvolution::generate() {
    // Generate random parameters according to user specifications
    // Calculate fitness of Artvolution
    calculateFitness();
    // Save Artvolution to a file
    saveToFile();
}

void Artvolution::randomize() {
    // Generate random parameters
    // Calculate fitness of Artvolution
    calculateFitness();
    // Save Artvolution to a file
    saveToFile();
}

void Artvolution::mutate() {
    // Generate mutated parameters
    // Calculate fitness of Artvolution
    calculateFitness();
    // Save Artvolution to a file
    saveToFile();
}

void Artvolution::crossover() {
    // Generate new parameters from 2 previous Artvolution
    // Calculate fitness of new Artvolution
    calculateFitness();
    // Save new Artvolution to a file
    saveToFile();
}

std::string Artvolution::getName() { return name; }

std::vector<int> Artvolution::getParameters() { return parameters; }

int Artvolution::getFitness() { return fitness; }

void Artvolution::calculateFitness() { 
    // Calculate the fitness of the Artvolution
    // based on its parameters
}

void Artvolution::saveToFile() {
    // Save the Artvolution to a file
    // Format: Name,Generation,Fitness,Parameters
}