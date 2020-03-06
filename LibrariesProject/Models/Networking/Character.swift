//
//  CharacterModel.swift
//  LibrariesProject
//
//  Created by underq  on 04.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct Character: Decodable {
    
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
    
    //custom init for check API misses
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
    
    func createLabels() -> CharacterLabelData {
        let nameLabel = name
        let imageLink = image
        let homeworldLabel = "homeworld: \(homeworld ?? "?")"
        let genderLabel = "gender: \(gender)"
        let heightLabel = "height: \(height == nil ? "?" : String(height!))"
        let massLabel = "mass: \(mass == nil ? "?" : String(mass!))"
        let speciesLabel = "species: \(species)"
        let skinColorLabel = "skin color: \(skinColor ?? "?")"
        let eyeColorLabel = "eye color: \(eyeColor ?? "?")"
        
        return CharacterLabelData(
            name: nameLabel,
            image: imageLink,
            homeworld: homeworldLabel,
            gender: genderLabel,
            height: heightLabel,
            mass: massLabel,
            species: speciesLabel,
            skinColor: skinColorLabel,
            eyeColor: eyeColorLabel)
    }
}


