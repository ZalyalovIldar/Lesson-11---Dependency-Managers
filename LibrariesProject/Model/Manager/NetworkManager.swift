//
//  NetworkManager.swift
//  LibrariesProject
//
//  Created by Роман Шуркин on 23.05.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func getHeroes(completion: @escaping([Hero]?, AFError?) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    let urlString = "https://akabab.github.io/starwars-api/api/all.json"
    
    func getHeroes(completion: @escaping ([Hero]?, AFError?) -> Void) {
        
        AF.request(urlString).responseDecodable(of: [Hero].self) { response in
            
            completion(response.value, response.error)
        }
    }
}
