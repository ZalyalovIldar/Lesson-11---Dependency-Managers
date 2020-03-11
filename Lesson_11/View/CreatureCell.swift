import UIKit
import SDWebImage

class CreatureCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var creatureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    //MARK: - Setups
    
    func setup(for creature: Creature) {
        
        setupUI()
        
        if let imageURL = URL(string: creature.image) {
            
            let placeholder = UIImage(named: "placeholder")
            creatureImageView.sd_setImage(with: imageURL, placeholderImage: placeholder)
        }
        nameLabel.text = creature.name
        genderLabel.text = creature.gender
        massLabel.text = String(creature.mass)
        heightLabel.text = String(creature.height)
    }
    
    func setupUI() {
        
        selectionStyle = .none
        creatureImageView.layer.cornerRadius = creatureImageView.frame.height / 6
    }
}
