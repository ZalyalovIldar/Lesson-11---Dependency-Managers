//
//  DrawerViewController.swift
//  LibrariesProject
//
//  Created by underq  on 06.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import SDWebImage

class DrawerViewController: UIViewController {

    // MARK: - Outlets and constants
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterHeightLabel: UILabel!
    @IBOutlet weak var characterMassLabel: UILabel!
    @IBOutlet weak var characterSpeciesLabel: UILabel!
    
    private let placeholderPic = "starwarsPlaceholder"
    private var character: CharacterLabelData!
    
    // MARK: - Data Configuration
    
    /// set VC data
    /// - Parameter character: object with prepared data
    func configure(with character: CharacterLabelData){
        self.character = character
    }
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        characterImageView.sd_setImage(with: URL(string: character.image), placeholderImage: UIImage(named: placeholderPic)) { [weak self] image, _, _, _ in

            //additional check
            guard let self = self else { return }

            //reload image
            DispatchQueue.main.async {
                self.characterImageView.image = image
                self.characterImageView.contentMode = .scaleToFill
            }
        }
        characterNameLabel.text = character.name
        characterGenderLabel.text = character.gender
        characterHeightLabel.text = character.height
        characterMassLabel.text = character.mass
        characterSpeciesLabel.text = character.species
    }
}
