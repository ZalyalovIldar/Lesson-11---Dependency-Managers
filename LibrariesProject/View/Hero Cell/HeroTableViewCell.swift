//
//  HeroTableViewCell.swift
//  LibrariesProject
//
//  Created by Enoxus on 04/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import SDWebImage

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    
    private let placeholderImageName = "vader"
    
    /// method that configures the cell labels and image view
    /// - Parameter hero: entity that holds the necessary data
    func configure(with hero: HeroDto) {
        
        genderLabel.text = hero.gender
        homeworldLabel.text = hero.homeworld
        heroNameLabel.text = hero.name
        heroImageView.sd_setImage(with: URL(string: hero.image), placeholderImage: UIImage(named: placeholderImageName)) { [weak self] image, _, _, _ in
            
            guard let self = self else { return }
            
            self.heroImageView.image = image?.resizeTopAlignedToFill(newWidth: self.heroImageView.frame.width)
        }
    }
}
