public class Artvolution {
	
	//Fields
	private String artType;
	
	//Constructor 
	 public Artvolution (String artType) {
	   this.artType = artType;
	 }
	
	//Methods
	public void createArt() { 
		if (artType.equalsIgnoreCase("canvas")) { 
			System.out.println("Creating a canvas painting."); 
		} else if (artType.equalsIgnoreCase("sculpture")) { 
			System.out.println("Creating a sculpture."); 
		} else { 
			System.out.println("Creating something else."); 
		}
	}
	
	public void modifyArt(String tool) {
		System.out.println("Using " + tool + " to modify the artwork.");
	}
	
	public void collaborateArt(String collaborator) {
		System.out.println("Collaborating with " + collaborator + " on the artwork.");
	}
	
	public void displayArt() {
		System.out.println("Displaying the artwork for others to appreciate.");
	}
	 
	//Main
	public static void main(String[] args) {
		Artvolution artvolution = new Artvolution("canvas");
		artvolution.createArt();
		artvolution.modifyArt("brush");
		artvolution.collaborateArt("Michelle");
		artvolution.displayArt();
	}
}