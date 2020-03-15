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
    // Title for error alert
    private let errorTitle = "Error!"
    // Closing alert action title
    private let closeActionTitle = "Close"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: heroCellNibName, bundle: nil), forCellReuseIdentifier: heroCellReuseIdentifier)
        
        let networkManager = NetworkManager()
        networkManager.getHeroes { [weak self] heroes, error in
            
            if let error = error{
                self?.showErrorAlert(error: error)
            } else {
                DispatchQueue.main.async {
                    
                    self?.heroesArray = heroes
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    
    /// Method for alert presenting
    /// - Parameter error: Error to present to user
    func showErrorAlert(error: Error){
        
        let alertController = UIAlertController(title: errorTitle, message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: closeActionTitle, style: .default, handler: nil)
        alertController.addAction(okAction)

        present(alertController, animated: true)
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
