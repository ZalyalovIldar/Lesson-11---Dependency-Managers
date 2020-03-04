import UIKit

fileprivate enum Constants {
    
    static let creatureCellIdentifier = "CreatureCell"
}

class PrimaryContentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var creatures: [Creature] = []
    
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

extension PrimaryContentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let creatureNibCell = UINib(nibName: Constants.creatureCellIdentifier, bundle: nil)
        tableView.register(creatureNibCell, forCellReuseIdentifier: Constants.creatureCellIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = false
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
}
