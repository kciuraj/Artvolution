// Module: Artvolution 

extern crate rand; 
use rand::Rng;

fn main() {

// Declare vars
let mut canvas_list: Vec<Vec<u8>> = Vec::new(); 
let mut current_img: Vec<Vec<u8>> = Vec::new(); 
let mut next_img: Vec<Vec<u8>> = Vec::new();
let mut canvas_width = 0; 
let mut canvas_height = 0; 
let mut num_colors = 0; 
let mut num_generations = 0;

// Initialize the canvas
println!("Please enter canvas length:");
canvas_width = read_input();
println!("Please enter canvas height:");
canvas_height = read_input();
println!("Please enter number of colors:");
num_colors = read_input();

for _ in 0..canvas_width{
    let mut row_buffer: Vec<u8> = Vec::new();
    for _ in 0..canvas_height{
        row_buffer.push(rand::thread_rng().gen_range(0, num_colors));
    }
    canvas_list.push(row_buffer);
}

// Copy the canvas
current_img = canvas_list.clone();

println!("Please enter number of generations:");
num_generations = read_input();

// Evolve the canvas
for _gen in 0..num_generations{
    for row in 0..canvas_width{
        for col in 0..canvas_height{
            // Get surrounding pixel values
            let left_col = if col == 0 { canvas_height - 1 } else { col - 1 };
            let right_col = if col == (canvas_height - 1) { 0 } else { col + 1 };
            let top_row = if row == 0 { canvas_width - 1 } else { row - 1 };
            let bottom_row = if row == (canvas_width - 1) { 0 } else { row + 1 };
            let current_pixel = canvas_list[row][col];
            let top_pixel = canvas_list[top_row][col];
            let bottom_pixel = canvas_list[bottom_row][col];
            let left_pixel = canvas_list[row][left_col];
            let right_pixel = canvas_list[row][right_col];
            
            // Accept/Reject changes
            let mut new_color = current_pixel;
            if top_pixel == current_pixel && bottom_pixel == current_pixel && left_pixel == current_pixel && right_pixel == current_pixel {
                new_color = rand::thread_rng().gen_range(0, num_colors);
            }
            next_img[row][col] = new_color;
        }
    }
    current_img = next_img.clone();
    println!("Generation {} complete.", _gen);
}

// Print the final canvas
println!("Final canvas:");
for row in 0..canvas_width{
    for col in 0..canvas_height{
        let _pixel = current_img[row][col];
        print!("{} ", _pixel);
    }
    println!("");
}

}

fn read_input() -> u8 {
    let mut input = String::new();
    std::io::stdin().read_line(&mut input)
        .expect("Failed to read line");
    let parsed_input: u8 = match input.trim().parse() {
        Ok(num) => num,
        Err(_) => 0,
    };
    return parsed_input;
}