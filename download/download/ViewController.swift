//
//  ViewController.swift
//  download
//
//  Created by Ettinger Fabian on 11.01.22.
//

import UIKit

class ViewController: UIViewController {

    var queue = DispatchQueue(label: "Download");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var variable = "Hallo";
        queue.async {
            let x = 420;
            print("in queue: \(variable)");
            DispatchQueue.main.async {
                print("main \(x)")
            }
        }
        
    }


}

