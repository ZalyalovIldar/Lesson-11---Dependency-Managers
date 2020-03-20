//
//  TableViewController.swift
//  LibrariesProject
//
//  Created by underq  on 04.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import FittedSheets

class TableViewController: UITableViewController {
    
    // MARK: - Constants
    
    private var characters: [CharacterLabelData] = []
    private let cellIdentifier = "characterCell"
    private let networkManager = NetworkManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //download and update characters data
        networkManager.getCharacters { [weak self] result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let characters):
                    
                    self?.characters = characters
                    self?.tableView.reloadData()
                    
                //if didn't get data stop tableView configuring
                case .failure( _):
                    
                    return
                }
                
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CharacterTableViewCell
        
        //set cell data
        cell.configure(with: characters[indexPath.row])
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //create drawer
        let controller = DrawerViewController()
        
        //set drawer data
        controller.configure(with: characters[indexPath.row])
        
        //prepare to present drawer
        let sheet = SheetViewController(controller: controller, sizes: [.halfScreen, .fullScreen])
        sheet.blurBottomSafeArea = false
        
        present(sheet, animated: false)
    }
}
