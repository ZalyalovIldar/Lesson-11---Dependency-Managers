import UIKit

class AlertService {
    
    static let shared = AlertService()
    
    func showErrorAlert(on vc: UIViewController, error: Error) {
        
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
}
