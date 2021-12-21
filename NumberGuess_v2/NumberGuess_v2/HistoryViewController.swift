import UIKit

class HistoryViewController: UIViewController {

    var model: Model?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Gratuliere, Sie haben \(model?.guessCount ?? -1) Versuche gebraucht!";
        if model?.guessCount ?? 0 < 10 {
            imageView.image = UIImage.init(named: "happy.png")
        } else {
            imageView.image = UIImage.init(named: "sad.png")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tvc = segue.destination as? TableViewController;
        tvc?.guesses = model?.guesses ?? [Int]();
    }

}
