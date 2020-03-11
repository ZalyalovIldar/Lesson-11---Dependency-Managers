import Foundation

enum CreatureAPIKeys {
    
    static let id = "id"
    static let name = "name"
    static let homeworld = "homeworld"
    static let image = "image"
    static let height = "height"
    static let mass = "mass"
    static let gender = "gender"
}

class CreatureExtractor {
    
    static let shared = CreatureExtractor()
    
    func extractCreatures(from creaturesArrayJSON: [[String : Any]]) -> [Creature]? {
        
        var creatureModels: [Creature] = []
        
        for creatureJSON in creaturesArrayJSON {
            
            guard let id = creatureJSON[CreatureAPIKeys.id] as? Int else { return nil }
            
            let name = creatureJSON[CreatureAPIKeys.name] as? String ?? "Unknown"
            let image = creatureJSON[CreatureAPIKeys.image] as? String ?? ""
            let height = creatureJSON[CreatureAPIKeys.height] as? Double ?? 0.0
            let mass = creatureJSON[CreatureAPIKeys.mass] as? Double ?? 0.0
            let gender = creatureJSON[CreatureAPIKeys.gender] as? String ?? "Unknown"
            
            //В респонсе может прийти homeworld как строка так и массив строк
            var homeWorld = creatureJSON[CreatureAPIKeys.homeworld]
            switch homeWorld {
            case let string as String:
                homeWorld = string
            case let array as [String]:
                homeWorld = array.joined(separator: ", ")
            default:
                homeWorld = "Unknown"
            }
            
            let creatureModel = Creature(id: id,
                                         name: name,
                                         homeworld: homeWorld as! String, // <- Форсим безопасно
                                         image: image,
                                         height: height,
                                         mass: mass,
                                         gender: gender)
            creatureModels.append(creatureModel)
        }
        
        return creatureModels
    }
}
