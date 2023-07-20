package main
 
import (
    "fmt"
    "math/rand"
    "time"
)

// Artvolution is a generative art engine that evolves random
// images over time according to user-defined parameters.
func Artvolution(width, height int, iterations int) [][]int {
    // Initialize a 2-dimensional array with random values
    // representing the image
    image := make([][]int, width)
    for x := range image {
        image[x] = make([]int, height)
        for y := range image[x] {
            image[x][y] = rand.Intn(256)
        }
    }
    
    // Iterate over the image and apply mutations according to
    // the user-defined parameters
    rand.Seed(time.Now().Unix())
    for i := 0; i < iterations; i++ {
        // Select a random pixel to mutate
        x := rand.Intn(width)
        y := rand.Intn(height)
        
        // Generate a random mutation
        mutation := rand.Intn(256)
        
        // Apply the mutation to the selected pixel
        image[x][y] = mutation
    }
    
    return image
}

func main() {
    // Generate an image of size 10x10 with 100 iterations
    image := Artvolution(10, 10, 100)
    fmt.Println(image)
}