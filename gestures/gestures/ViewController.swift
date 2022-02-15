//
//  ViewController.swift
//  gestures
//
//  Created by Ettinger Fabian on 01.02.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var bingus: UIImageView!
    @IBOutlet weak var bingusLeft: NSLayoutConstraint!
    @IBOutlet weak var bingusTop: NSLayoutConstraint!
    
    @IBOutlet weak var herbert: UIImageView!
    @IBOutlet weak var herbertLeft: NSLayoutConstraint!
    @IBOutlet weak var herbertTop: NSLayoutConstraint!
    var top: CGFloat = 0;
    
    var width: CGFloat = CGFloat(0);
    var speed: CGFloat = 6.0;
    var hit: Bool = false;
    var score = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        top = herbertTop.constant
        scoreLabel.textColor = UIColor.init(white: 0.6, alpha: 0.4)
        
        width = UIScreen.main.bounds.width - herbert.bounds.width;
        bingusTop.constant = UIScreen.main.bounds.height - bingus.bounds.height - 50;
        
        // Do any additional setup after loading the view.
        let timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) {
            timer in
            
            self.herbertTop.constant += self.speed;
            if (self.herbertTop.constant > UIScreen.main.bounds.height) {
                self.resetHerbert()
            }
            
            if self.bingus.frame.intersects(self.herbert.frame) {
                self.herbert.image = UIImage(named: "herbert2.jpg")
                self.hit = true
            }
        }
    }
    
    func resetHerbert() {
        herbertTop.constant = top
        herbert.image = UIImage(named: "herbert.png")
        herbertLeft.constant = .random(in: 0.0...width);
        
        if (!hit) {
            speed = 6.0
            score = 0
        } else {
            score += 1;
            self.speed += 1;
        }
        scoreLabel.text = "\(score)"
        
        hit = false;
    }

    @IBAction func onPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)

        //bingusTop.constant += translation.y
        bingusLeft.constant += translation.x
        /*bingus.center = CGPoint(
          x: bingus.center.x + translation.x,
          y: bingus.center.y + translation.y
        )*/

        sender.setTranslation(.zero, in: view)
    }
    
}

