//
//  ViewController.swift
//  gestures
//
//  Created by Ettinger Fabian on 01.02.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bingus: UIImageView!
    @IBOutlet weak var bingusLeft: NSLayoutConstraint!
    @IBOutlet weak var bingusTop: NSLayoutConstraint!
    
    @IBOutlet weak var herbert: UIImageView!
    @IBOutlet weak var herbertLeft: NSLayoutConstraint!
    @IBOutlet weak var herbertTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            
            print("Timer was fired")
        }
    }

    @IBAction func onPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)

        bingusTop.constant += translation.y
        bingusLeft.constant += translation.x
        /*bingus.center = CGPoint(
          x: bingus.center.x + translation.x,
          y: bingus.center.y + translation.y
        )*/
        if bingus.frame.intersects(herbert.frame) {
            print("intersect");
            
        }

        sender.setTranslation(.zero, in: view)
    }
    
}

