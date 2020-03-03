import Foundation

struct Creature: Codable {
    
    var id: Int
    var name: String
    //var homeworld: [String]?
    var image: String
    var height: Double?
    var mass: Double?
    var gender: String
}
