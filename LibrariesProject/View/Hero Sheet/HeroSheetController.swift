//
//  HeroSheetController.swift
//  LibrariesProject
//
//  Created by Enoxus on 05/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class HeroSheetController: UIViewController {
    
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    /// entity that holds the info that needs to be displayed
    private var hero: HeroDto!
    
    private let placeholderImageName = "vader"
    
    /// setter for entity field
    /// - Parameter hero: entity to be set
    func configure(with hero: HeroDto) {
        self.hero = hero
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        imageView.sd_setImage(with: URL(string: hero.image), placeholderImage: UIImage(named: placeholderImageName)) { [weak self] image, _, _, _ in
            
            guard let self = self else { return }
            
            self.imageView.image = image?.resizeTopAlignedToFill(newWidth: self.imageView.frame.width)
        }

        eyeColorLabel.text = hero.eyeColor
        skinColorLabel.text = hero.skinColor
        speciesLabel.text = hero.species
        massLabel.text = hero.mass
        heightLabel.text = hero.height
        genderLabel.text = hero.gender
        homeLabel.text = hero.homeworld
        nameLabel.text = hero.name
    }
}
