//
//  Hero.swift
//  LibrariesProject
//
//  Created by Роман Шуркин on 24.05.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct Hero: Codable {
    
    var name: String
    var homeworld: [String]?
    var image: String
    var bornLocation: String?
    var diedLocation: String?
    
    enum CodingKeys: String, CodingKey {

        case name
        case image
        case homeworld
        case bornLocation
        case diedLocation
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decode(String.self, forKey: .image)
        
        self.homeworld = try? container.decode([String].self, forKey: .homeworld)
        
        if self.homeworld == nil {
            
            let str = try? container.decode(String.self, forKey: .homeworld) 
            
            self.homeworld = [str ?? ""]
        }
        
        self.bornLocation = try? container.decode(String.self, forKey: .bornLocation)
        self.diedLocation = try? container.decode(String.self, forKey: .diedLocation)
    }
}
