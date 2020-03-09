//
//  ViewController.swift
//  LibrariesProject
//
//  Created by Ильдар Залялов on 02.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import SDWebImage
import FloatingPanel

class ViewController: UIViewController {
    
    /// Table view for heroes
    private var tableView: UITableView!
    
    /// Array of received heroes
    private var heroes = [Hero]()
    
    /// Netwwork manager instance
    private var networkManager: NetworkManagerProtocol!
    
    /// FloatingPanelController instance
    private var fpc: FloatingPanelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Heroes"
        
        networkManager = NetworkManager()
        networkManager.getHeroesInfo { [weak self] heroesArray in
            
            DispatchQueue.main.async {
                self?.heroes = heroesArray
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        fpc = FloatingPanelController()
    }
    
    /// Method, that initialize tableView & add constraints to it
    private func initTableView() {
        
        tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: HeroCell.self)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDelegate & UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeroCell.identifier, for: indexPath) as! HeroCell
        
        cell.configure(with: heroes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = DetailController()
        detailVC.configure(with: heroes[indexPath.row])

        fpc.set(contentViewController: detailVC)
        fpc.addPanel(toParent: self)
    }
}

