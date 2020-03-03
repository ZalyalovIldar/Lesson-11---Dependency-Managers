import Alamofire

enum DataResponseResult {
    
    case success(creatures: [Creature])
    case failure(error: Error)
}

class RemoteDataManager {
    
    static let shared = RemoteDataManager()
    
    private let baseURL = "https://akabab.github.io/starwars-api/api/all.json"
    
    func getData(complition: @escaping (DataResponseResult) -> ()) {
        
        guard let url = URL(string: baseURL) else { return }
        
        Alamofire.request(url).responseData { response in
            
            if let error = response.error {
                
                DispatchQueue.main.async {
                    
                    complition(.failure(error: error))
                }
            }
            
            if let data = response.result.value {

                guard let creatures = try? JSONDecoder().decode([Creature].self, from: data) else {
                    print("<DEBUG> Couldn't extract creatures from JSON")
                    return
                }
                complition(.success(creatures: creatures))
            }
        }
    }
}
