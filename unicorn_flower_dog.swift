import UIKit

//MARK: - Enum

enum Artvolution {
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case brown
    case black
    case white
}

//MARK: - Struct

struct Artwork {
    var title: String
    var artist: String
    var image: UIImage
    var style: Artvolution
}

//MARK: - Class

class Gallery {
    var artworks = [Artwork]()
    
    func addArtwork(title: String, artist: String, image: UIImage, style: Artvolution) {
        let artwork = Artwork(title: title, artist: artist, image: image, style: style)
        artworks.append(artwork)
    }
    
    func removeArtwork(index: Int) {
        artworks.remove(at: index)
    }
    
    func countArtworkByStyle(style: Artvolution) -> Int {
        var count = 0
        for artwork in artworks {
            if artwork.style == style {
                count += 1
            }
        }
        return count
    }
    
    func displayArtworkByStyle(style: Artvolution) {
        for artwork in artworks {
            if artwork.style == style {
                print("Title: \(artwork.title), Artist: \(artwork.artist)")
            }
        }
    }
}

//MARK: - Initializing and Adding Artwork

let gallery = Gallery()

gallery.addArtwork(title: "Mona Lisa", artist: "Leonardo da Vinci", image: UIImage(systemName: "photo.fill")!, style: .red)
gallery.addArtwork(title: "The Starry Night", artist: "Vincent van Gogh", image: UIImage(systemName: "photo.fill")!, style: .blue)
gallery.addArtwork(title: "The Scream", artist: "Edvard Munch", image: UIImage(systemName: "photo.fill")!, style: .brown)
gallery.addArtwork(title: "The Kiss", artist: "Gustav Klimt", image: UIImage(systemName: "photo.fill")!, style: .red)

//MARK: - Removing Artwork

gallery.removeArtwork(index: 1)

//MARK: - Count Artwork by Style

let redArtCount = gallery.countArtworkByStyle(style: .red)

//MARK: - Display Artwork by Style

gallery.displayArtworkByStyle(style: .red)