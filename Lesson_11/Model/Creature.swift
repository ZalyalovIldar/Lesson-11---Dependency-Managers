import Foundation

struct Creature: Codable {
    
    var id: Int
    var name: String
    var homeworld: String
    var image: String
    var height: Double
    var mass: Double
    var gender: String

    init(id: Int,
         name: String,
         homeworld: String,
         image: String,
         height: Double,
         mass: Double,
         gender: String) {
        
        self.id = id
        self.name = name
        self.homeworld = homeworld
        self.image = image
        self.height = height
        self.mass = mass
        self.gender = gender
    }
}
