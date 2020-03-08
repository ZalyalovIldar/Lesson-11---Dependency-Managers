//
//  HeroCustomCell.swift
//  LibrariesProject
//
//  Created by Евгений on 07.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import SDWebImage

class HeroCustomCell: UITableViewCell {
    
    
    // Placeholder image's name
    private let placeholderImageName = "placeholder"
    
    // ImageView for hero's image
    @IBOutlet weak var heroImageView: UIImageView!
    // Label for hero's name
    @IBOutlet weak var heroNameLabel: UILabel!
    // Label for hero's homeworld
    @IBOutlet weak var heroHomeworldLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// Method for configuration current cell with specific hero
    /// - Parameter hero: Hero structure to configure with
    func configure(with hero: Hero) {
        
        self.heroImageView.sd_setImage(with: URL(string: hero.image), placeholderImage: UIImage(named: placeholderImageName))
        self.heroNameLabel.text = hero.name
        self.heroHomeworldLabel.text = hero.homeworld
    }
}
