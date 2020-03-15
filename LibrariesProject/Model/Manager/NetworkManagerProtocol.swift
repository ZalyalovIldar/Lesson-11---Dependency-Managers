//
//  NetworkManagerProtocol.swift
//  LibrariesProject
//
//  Created by Евгений on 07.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    
    /// Method for getting array of hero structures
    /// - Parameter completion: Completion to work with array of hero structures
    func getHeroes(completion: @escaping ([Hero], Error?) -> Void)
}
