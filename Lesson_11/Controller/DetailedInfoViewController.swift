import UIKit
import SDWebImage

class DetailedInfoViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var creatureNameLabel: UILabel!
    @IBOutlet weak var creatureImageView: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var homeWorldLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    //MARK: - Properties
    
    var creature: Creature!
    
    //MARK: - UIVIewController

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
