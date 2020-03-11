import UIKit
import SDWebImage

class DetailedInfoViewController: UIViewController {
    
    @IBOutlet weak var creatureNameLabel: UILabel!
    @IBOutlet weak var creatureImageView: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var homeWorldLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var creature: Creature!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatureNameLabel.text = creature.name
        heightLabel.text = String(creature.height)
        massLabel.text = String(creature.mass)
        homeWorldLabel.text = creature.homeworld
        genderLabel.text = creature.gender
        
        let imageURL = URL(string: creature.image)
        creatureImageView.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "placeholder.png"))
    }
}
