//
//  Hero.swift
//  LibrariesProject
//
//  Created by Enoxus on 04/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct Hero: Codable {
    
    let name: String
    let image: String
    var homeworld: String?
    let gender: String
    let height: Double?
    let mass: Int?
    let species: String
    let skinColor: String?
    let eyeColor: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case image
        case homeworld
        case gender
        case height
        case mass
        case species
        case skinColor
        case eyeColor
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(String.self, forKey: .image)
        homeworld = try? container.decode(String.self, forKey: .homeworld)
        
        if homeworld == nil {
            homeworld = try? container.decode([String].self, forKey: .homeworld).joined(separator: ", ")
        }
        
        gender = try container.decode(String.self, forKey: .gender)
        height = try? container.decode(Double.self, forKey: .height)
        mass = try? container.decode(Int.self, forKey: .mass)
        species = try container.decode(String.self, forKey: .species)
        skinColor = try? container.decode(String.self, forKey: .skinColor)
        eyeColor = try? container.decode(String.self, forKey: .eyeColor)
    }
    
    /// method that converts the model to a dto that is used in a view
    func toDto() -> HeroDto {
        
        let dtoName = name
        let dtoImage = image
        let dtoHome = "Homeword: \(homeworld ?? "unknown")"
        let dtoGender = "Gender: \(gender)"
        let dtoHeight = "Height: \(height == nil ? "unknown" : String(height!))"
        let dtoMass = "Mass: \(mass == nil ? "unknown" : String(mass!))"
        let dtoSpecies = "Species: \(species)"
        let dtoSkinColor = "Skin color: \(skinColor ?? "unknown")"
        let dtoEyeColor = "Eye color: \(eyeColor ?? "unknown")"
        
        return HeroDto(name: dtoName, image: dtoImage, homeworld: dtoHome, gender: dtoGender, height: dtoHeight, mass: dtoMass, species: dtoSpecies, skinColor: dtoSkinColor, eyeColor: dtoEyeColor)
    }
}
