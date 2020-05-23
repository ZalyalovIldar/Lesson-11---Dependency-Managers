//
//  DetailViewController.swift
//  LibrariesProject
//
//  Created by Роман Шуркин on 24.05.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var hero: Hero? {
        
        didSet {
            self.updateUI()
        }
    }
    
    var imageView = UIImageView()
    var nameLabel = UILabel()
    var homeworldLabel = UILabel()
    var bornLocationLabel = UILabel()
    var diedLocationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
    }
    
    func setUp() {
        
        self.view.backgroundColor = .white
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.homeworldLabel.translatesAutoresizingMaskIntoConstraints = false
        self.bornLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.diedLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(homeworldLabel)
        self.view.addSubview(bornLocationLabel)
        self.view.addSubview(diedLocationLabel)
        
        self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        self.imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 10).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: self.view.frame.width / 2 - 20 ).isActive = true
        
        self.imageView.contentMode = .scaleAspectFit
        
        self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 10).isActive = true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor, constant: 0).isActive = true
        
        self.homeworldLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5).isActive = true
        self.homeworldLabel.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor, constant: 0).isActive = true
        
        self.bornLocationLabel.topAnchor.constraint(equalTo: self.homeworldLabel.bottomAnchor, constant: 5).isActive = true
        self.bornLocationLabel.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor, constant: 0).isActive = true
        
        self.diedLocationLabel.topAnchor.constraint(equalTo: self.bornLocationLabel.bottomAnchor, constant: 5).isActive = true
        self.diedLocationLabel.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor, constant: 0).isActive = true
        
        self.updateUI()
    }

    func updateUI() {
        
        self.imageView.sd_setImage(with: URL(string: self.hero?.image ?? ""))
        self.nameLabel.text = self.hero?.name ?? ""
        self.homeworldLabel.text = self.hero?.homeworld?.first ?? ""
        self.bornLocationLabel.text = self.hero?.bornLocation ?? ""
        self.diedLocationLabel.text = self.hero?.diedLocation ?? ""
    }
}
