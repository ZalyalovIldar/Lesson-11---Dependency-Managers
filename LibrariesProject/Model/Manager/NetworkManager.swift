//
//  NetworkManager.swift
//  LibrariesProject
//
//  Created by Евгений on 07.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager: NetworkManagerProtocol {
    
    // Link for using API
    private let apiLink = "https://akabab.github.io/starwars-api/api/all.json"
    
    /// Method for getting array of hero structures
    /// - Parameter completion: Completion to work with array of hero structures
    func getHeroes(completion: @escaping ([Hero], Error?) -> Void) {
        
        AF.request(apiLink).responseDecodable(of: [Hero].self) { (response) in
            
            guard let heroes = response.value else { return }
            
            if let error = response.error {
                
                DispatchQueue.main.async {
                    completion([],error)
                }   
            }
        
            DispatchQueue.main.async {
                completion(heroes, nil)
            }
        }
    }
}
