//
//  NetworkManager.swift
//  LibrariesProject
//
//  Created by underq  on 04.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    //API URL
    let url = "https://akabab.github.io/starwars-api/api/all.json"
    
    func getCharacters(completion: @escaping (Result<[CharacterLabelData], Error>) -> Void) {
        
        //API request
        AF.request(url).validate().responseDecodable(of: [Character].self) { (response) in
            
            if let error = response.error {
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            //check response data
            guard let characters = response.value else { return }
            
            //creating labels in the main thread
            DispatchQueue.main.async {
                completion(.success(characters.map({ $0.createLabels() })))
            }
        }
    }
}
