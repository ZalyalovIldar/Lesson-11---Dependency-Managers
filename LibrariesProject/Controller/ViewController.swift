//
//  ViewController.swift
//  LibrariesProject
//
//  Created by Ильдар Залялов on 02.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import FittedSheets

class ViewController: UIViewController {
    
    var networkManager: NetworkManagerProtocol = NetworkManager()
    
    var tableView = UITableView()
    
    var heroes: [Hero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
        
        self.setDataSource()
    }
    
    func setUp() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(HeroCell.self, forCellReuseIdentifier: HeroCell.cellReuseIdentifier)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
    
    func setDataSource() {
        
        self.networkManager.getHeroes { [weak self] (heroes, error) in
            
            if error != nil {
                print(error!.errorDescription ?? "Failure")
                return
            }
            
            guard let heroes = heroes else { print("Heroes is nil"); return }
            
            DispatchQueue.main.async {
                
                self?.heroes = heroes
                self?.tableView.reloadData()
            }
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeroCell.cellReuseIdentifier, for: indexPath) as! HeroCell
        
        cell.configure(heroes[indexPath.row])
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DetailViewController()
        
        controller.hero = self.heroes[indexPath.row]
        
        let sheet = SheetViewController(controller: controller, sizes: [.halfScreen])
        sheet.blurBottomSafeArea = false
        
        present(sheet, animated: false)
    }
}
