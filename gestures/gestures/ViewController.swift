//
//  ViewController.swift
//  gestures
//
//  Created by Ettinger Fabian on 01.02.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bingus: UIImageView!
    @IBOutlet weak var herbert: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)


        bingus.center = CGPoint(
          x: bingus.center.x + translation.x,
          y: bingus.center.y + translation.y
        )
        if bingus.frame.intersects(herbert.frame) {
            print("intersect");
            herbert.image = UIImage.init(named: "herbert2.jpg")
        }

        sender.setTranslation(.zero, in: view)
    }
    
}

