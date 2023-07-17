#This program will simulate the evolution of art through the ages

#import statements
import random

#global variables
canvasSize = (800, 600)
imageList = []

#class definitions
class Artwork:
    ''' Artwork represents an individual painting or image '''
    def __init__(self, image, size, location):
        self.image = image
        self.size = size
        self.location = location

class Artist:
    ''' Artist represents a person creating art '''
    def __init__(self, name, artStyle):
        self.name = name
        self.artStyle = artStyle
    
    def createArtwork(self):
        ''' Creates an Artwork object based on the artist's style '''
        # generate random values for each attribute
        image = random.choice(imageList)
        size = random.choice(range(100))
        location = random.choice(range(canvasSize[0]), range(canvasSize[1]))
        
        # create and return the artwork
        artwork = Artwork(image, size, location)
        return artwork
    
#function definitions
def loadImages():
    ''' Loads images from a folder into the list '''
    # open the folder and loop through each image
    # and append it to the list

def simulateEvolution(n):
    ''' Simulates the evolution of art over time by generating n
        artworks from different artists and adding them to a list '''
    # list for storing artworks
    artworks = []
    # loop n times
    for i in range(n):
        # generate random artist
        artist = Artist(name, random.choice(artStyles))
        # create artwork from artist
        artwork = artist.createArtwork()
        # add artwork to artworks list
        artworks.append(artwork)
    return artworks

#main
if __name__ == '__main__':
    #load the images
    loadImages()
    #run the simulation
    artworks = simulateEvolution(1000)
    #print the results
    print("The evolution of art over time:")
    for artwork in artworks:
        print(work)