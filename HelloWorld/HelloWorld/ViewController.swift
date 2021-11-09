import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var constraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
    }

    @IBAction func onTouchUpInside(_ sender: UIButton) {
        counter += 1
        updateCounterLabel()
    }
    
    func updateCounterLabel() {
        counterLabel.textColor = random()
        button.backgroundColor = random()
        button.setTitleColor(random(), for: .normal)
        constraint.constant = .random(in: -200...200)
        self.view.layoutIfNeeded()
        self.view.backgroundColor = random()
        counterLabel.text = "Counter: \(counter) clicks"
    }
    
    func random() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
    
}

