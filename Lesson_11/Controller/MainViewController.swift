import UIKit
import Presentr

//MARK: - Constants

fileprivate enum Constants {
    
    static let creatureCellIdentifier = "CreatureCell"
}

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var creatures: [Creature] = []
    let presenter: Presentr = {
        
        let width = ModalSize.full
        let height = ModalSize.fluid(percentage: 0.82)
        let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: 0, y: 0))
        let customType = PresentationType.custom(width: width, height: height, center: center)

        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverVerticalFromTop
        return customPresenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchData()
    }
    
    func fetchData() {
        
        RemoteDataManager.shared.getData { result in
            
            switch result {
                
            case .failure(let error):
                self.handle(error: error)
                
            case .success(let creatures):
                self.apply(creatures: creatures)
            }
        }
    }
    
    func apply(creatures: [Creature]) {
        
        self.creatures = creatures
        self.tableView.reloadData()
    }
    
    func handle(error: Error) {
        AlertService.shared.showErrorAlert(on: self, error: error)
    }
}

//MARK: - TableView Stack

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let creatureNibCell = UINib(nibName: Constants.creatureCellIdentifier, bundle: nil)
        tableView.register(creatureNibCell, forCellReuseIdentifier: Constants.creatureCellIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return creatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.creatureCellIdentifier) as! CreatureCell
        cell.setup(for: creatures[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCreature = creatures[indexPath.row]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailedInfoVC = storyboard.instantiateViewController(identifier: "DetailedInfoVC") as! DetailedInfoViewController
        detailedInfoVC.creature = selectedCreature
        
        DispatchQueue.main.async {
            self.customPresentViewController(self.presenter, viewController: detailedInfoVC, animated: true)
        }
    }
}
