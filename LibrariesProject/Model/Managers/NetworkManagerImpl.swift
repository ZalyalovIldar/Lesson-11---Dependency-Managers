//
//  NetworkManagerImpl.swift
//  LibrariesProject
//
//  Created by Enoxus on 04/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManagerImpl: NetworkManager {
        
    func getAllHeroes(completion: @escaping ([HeroDto]) -> Void) {
        
        AF.request(Endpoints.allHeroes).responseDecodable(of: [Hero].self) { (response) in
            
            guard let heroes = response.value else { return }
            
            DispatchQueue.main.async {
                completion(heroes.map({ $0.toDto() }))
            }
        }
    }
}
