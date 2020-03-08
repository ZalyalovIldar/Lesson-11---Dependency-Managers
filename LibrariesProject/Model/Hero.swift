//
//  File.swift
//  LibrariesProject
//
//  Created by Евгений on 07.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct Hero: Codable {
    
    // Text for information that not stated in API
    private let notStatedText = "Not stated"
    
    let name: String
    var homeworld: String?
    let image: String
    let mass: Int?
    let gender: String
    let height: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case image
        case homeworld
        case gender
        case height
        case mass
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(String.self, forKey: .image)
        homeworld = try? container.decode(String.self, forKey: .homeworld)
        gender = try container.decode(String.self, forKey: .gender)
        height = try? container.decode(Double.self, forKey: .height)
        mass = try? container.decode(Int.self, forKey: .mass)
        
        if homeworld == nil {
            homeworld = notStatedText
        }
    }
}
