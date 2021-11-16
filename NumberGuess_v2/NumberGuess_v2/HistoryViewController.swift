import UIKit

class HistoryViewController: UIViewController {

    var model: Model?
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Gratuliere, Sie haben \(model?.guessCount ?? -1) Versuche gebraucht!";
    }

}
