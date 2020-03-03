import UIKit
import SDWebImage

class CreatureCell: UITableViewCell {
    
    @IBOutlet weak var creatureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    func setup(for creature: Creature) {
        
        setupUI()
        
        if let imageURL = URL(string: creature.image) {
            
            let placeholder = UIImage(named: "placeholder")
            creatureImageView.sd_setImage(with: imageURL, placeholderImage: placeholder)
        }
        nameLabel.text = creature.name
        genderLabel.text = creature.gender
        
        if let mass = creature.mass {
            massLabel.text = String(mass)
        } else {
            massLabel.text = "Unknown"
        }
        
        if let height = creature.height {
            heightLabel.text = String(height)
        } else {
            heightLabel.text = "Unknown"
        }
    }
    
    func setupUI() {
        
        creatureImageView.layer.cornerRadius = creatureImageView.frame.height / 6
    }
}
