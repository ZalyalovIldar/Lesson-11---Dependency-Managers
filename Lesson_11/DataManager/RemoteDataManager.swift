import Alamofire

enum DataResponseResult {
    
    case success(creatures: [Creature])
    case failure(error: Error)
}

class RemoteDataManager {
    
    //MARK: - Instance Properties
    
    static let shared = RemoteDataManager()
    
    private let baseURL = "https://akabab.github.io/starwars-api/api/all.json"
    
    //MARK: - Instance Methods
    
    func getData(complition: @escaping (DataResponseResult) -> ()) {
        
        guard let url = URL(string: baseURL) else { return }
        
        Alamofire.request(url).responseJSON { response in
            
            if let error = response.error {
                
                DispatchQueue.main.async {
                    
                    complition(.failure(error: error))
                }
            }
            
            if let resultArray = response.result.value as? [[String : Any]] {
                
                guard let creatures = CreatureExtractor.shared.extractCreatures(from: resultArray) else {
                    print("Couldn't extact creatures from response")
                    return
                }
                
                DispatchQueue.main.async {
                    complition(.success(creatures: creatures))
                }
            }
        }
    }
}
