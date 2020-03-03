import UIKit

fileprivate enum Constants {
    
    static let creatureCellIdentifier = "CreatureCell"
}

class MainViewController: UIViewController {

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
                print(error.localizedDescription)
                //TODO: Display error by some fancy way
                
            case .success(let creatures):
                self.creatures = creatures
                self.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let creatureNibCell = UINib(nibName: Constants.creatureCellIdentifier, bundle: nil)
        tableView.register(creatureNibCell, forCellReuseIdentifier: Constants.creatureCellIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView(frame: .zero)
        
        //TODO: Remove Separators
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
