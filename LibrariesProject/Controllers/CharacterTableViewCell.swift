//
//  CharacterTableViewCell.swift
//  LibrariesProject
//
//  Created by underq  on 04.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {
    
    // MARK: - Outlets and constants
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterHomeworldLabel: UILabel!
    
    private let placeholderPic = "starwarsPlaceholder"
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Data Configuration
    
    /// set cell data
    /// - Parameter character: object with prepared data
    func configure(with character: CharacterLabelData) {
        
        //download image from URL
        characterImageView.sd_setImage(with: URL(string: character.image), placeholderImage: UIImage(named: placeholderPic)) { [weak self] image, _, _, _ in
            
            //additional check
            guard let self = self else { return }
            
            //reload image
            DispatchQueue.main.async {
                self.characterImageView.image = image
                self.characterImageView.contentMode = .scaleAspectFill
            }
        }
        characterNameLabel.text = character.name
        characterHomeworldLabel.text = character.homeworld
    }
}
