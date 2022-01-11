//
//  ViewController.swift
//  download
//
//  Created by Ettinger Fabian on 11.01.22.
//

import UIKit

class ViewController: UIViewController {

    var queue = DispatchQueue(label: "Download");
    @IBOutlet weak var label: UILabel!
    let path = "https://jsonplaceholder.typicode.com/todos";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let variable = "Hallo";
        
        queue.async {
            let x = 420;
            print("in queue: \(variable)");
            self.download()
            
            DispatchQueue.main.async {
                print("main \(x)")
                self.label.text = "main \(x)"
            }
        }
        
    }
    
    func download() {
        if let url = URL(string: path) {
            if let data = try? Data(contentsOf: url) {
                print("downloaded: \(data)");
                if let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? Array<Any>{
                    print(obj);
                } else {
                    print("data parse failed")
                }
            } else {
                print("download failed");
            }
        }
        
    }


}

