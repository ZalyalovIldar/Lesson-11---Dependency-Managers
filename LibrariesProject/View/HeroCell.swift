//
//  HeroCell.swift
//  LibrariesProject
//
//  Created by Роман Шуркин on 24.05.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class HeroCell: UITableViewCell {
    
    static let cellReuseIdentifier = "HeroCell"
    static let widthImage: CGFloat = 30
    
    var imageViewHero = UIImageView()
    var nameLabel = UILabel()
    var homeworldLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        self.imageViewHero.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.imageViewHero)

        self.imageViewHero.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.imageViewHero.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.imageViewHero.widthAnchor.constraint(equalToConstant: HeroCell.widthImage).isActive = true
        self.imageViewHero.heightAnchor.constraint(equalTo: self.imageViewHero.widthAnchor).isActive = true
        
        self.imageViewHero.layer.masksToBounds = true
        self.imageViewHero.layer.cornerRadius = HeroCell.widthImage / 2
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.nameLabel)

        self.nameLabel.leftAnchor.constraint(equalTo: self.imageViewHero.rightAnchor, constant: 5).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        self.nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        self.homeworldLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.homeworldLabel)

        self.homeworldLabel.leftAnchor.constraint(equalTo: self.nameLabel.rightAnchor, constant: 5).isActive = true
        self.homeworldLabel.centerYAnchor.constraint(equalTo: self.nameLabel.centerYAnchor, constant: 0).isActive = true
        
        self.homeworldLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    
    func configure(_ hero: Hero) {
        
        self.selectionStyle = .none
        
        self.imageViewHero.sd_setImage(with: URL(string: hero.image))
        self.nameLabel.text = hero.name
        self.homeworldLabel.text = hero.homeworld?.first
        
        self.nameLabel.sizeToFit()
        self.homeworldLabel.sizeToFit()
    }
}
