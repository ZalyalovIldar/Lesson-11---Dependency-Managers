//
//  MoreInfoViewController.swift
//  LibrariesProject
//
//  Created by Евгений on 08.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import SDWebImage

class MoreInfoViewController: UIViewController {
    
    // Hero structure to present
    private var hero: Hero!
    // Placeholder image's name
    private let placeholderImageName = "placeholder"
    // Text for information that not stated in API
    private let notStatedText = "Not stated"
    
    // Label for hero's homeworld text
    @IBOutlet weak var heroHomeworldLabel: UILabel!
    // ImageView for hero's image
    @IBOutlet weak var heroImageView: UIImageView!
    // Label for hero's name
    @IBOutlet weak var heroNameLabel: UILabel!
    // Label for hero's gender
    @IBOutlet weak var heroGenderLabel: UILabel!
    // Label for hero's height
    @IBOutlet weak var heroHeightLabel: UILabel!
    // Label for hero's mass
    @IBOutlet weak var heroMassLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.heroImageView.sd_setImage(with: URL(string: hero.image), placeholderImage: UIImage(named: placeholderImageName))
        self.heroNameLabel.text = hero.name
        self.heroHomeworldLabel.text = hero.homeworld
        self.heroGenderLabel.text = hero.gender
        
        heroHeightLabel.text = hero.height == nil ? notStatedText : "\(hero.height!)"
        heroMassLabel.text = hero.mass == nil ? notStatedText : "\(hero.mass!)"
    }
    
    /// Method for configutation view with specific hero
    /// - Parameter hero: Hero structure to configure with
    func configure(with hero: Hero){
        self.hero = hero
    }
}
