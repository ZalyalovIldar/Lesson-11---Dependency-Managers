//
//  MainTableViewController.swift
//  LibrariesProject
//
//  Created by Enoxus on 04/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import FittedSheets

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// main tableview instance
    @IBOutlet weak var heroesTableView: UITableView!
    
    /// array of dto models
    private var heroes: [HeroDto] = []
    
    /// network manager instance
    private let networkManager: NetworkManager = NetworkManagerImpl()
    
    /// estimated cell height
    private let estimatedHeight: CGFloat = 120
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        heroesTableView.delegate = self
        heroesTableView.dataSource = self
        heroesTableView.estimatedRowHeight = estimatedHeight
                
        heroesTableView.register(cell: HeroTableViewCell.self)
        
        networkManager.getAllHeroes { [weak self] heroes in
            
            self?.heroes = heroes
            self?.heroesTableView.reloadData()
        }
    }
    
    /// handles the action of tapping on the specific cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = HeroSheetController()
        
        controller.configure(with: heroes[indexPath.row])
        
        let sheet = SheetViewController(controller: controller, sizes: [.halfScreen, .fullScreen])
        sheet.blurBottomSafeArea = false
        
        present(sheet, animated: false)
    }
    
    //MARK: - TableView Delegate&DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeroTableViewCell.nibName) as! HeroTableViewCell
        
        cell.configure(with: heroes[indexPath.row])
        
        return cell
    }
}
