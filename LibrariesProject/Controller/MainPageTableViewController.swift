//
//  MainPageTableViewController.swift
//  LibrariesProject
//
//  Created by Евгений on 07.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import FittedSheets

class MainPageTableViewController: UITableViewController {
    
    // Hero custom cell's nib name
    private let heroCellNibName = "HeroCustomCell"
    // Hero custom cell's reuse identifier
    private let heroCellReuseIdentifier = "customCell"
    // Array of hero structures
    private var heroesArray: [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: heroCellNibName, bundle: nil), forCellReuseIdentifier: heroCellReuseIdentifier)
        
        let networkManager = NetworkManager()
        networkManager.getHeroes { [weak self] heroes in
            
            DispatchQueue.main.async {
                
                self?.heroesArray = heroes
                self?.tableView.reloadData()
            }
        }
    }
    
    //MARK:- TableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: heroCellReuseIdentifier) as! HeroCustomCell
        cell.configure(with: heroesArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        let moreInfoController = MoreInfoViewController()
        moreInfoController.configure(with: heroesArray[indexPath.row])
        let sheetController = SheetViewController(controller: moreInfoController, sizes: [.fullScreen, .halfScreen])
        self.present(sheetController,animated: false, completion: nil)
    }
}
