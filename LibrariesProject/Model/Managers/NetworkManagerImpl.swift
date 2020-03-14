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
        
    func getAllHeroes(completion: @escaping (Result<[HeroDto], Error>) -> Void) {
        
        AF.request(Endpoints.allHeroes).responseDecodable(of: [Hero].self) { (response) in
            
            if let error = response.error {
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                
                return
            }
            
            guard let heroes = response.value else { return }
                        
            DispatchQueue.main.async {
                completion(.success(heroes.map({ $0.toDto() })))
            }
        }
    }
}
