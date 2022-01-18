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
    var todoModel = TodoModel();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let variable = "Hallo";
        
        queue.async {
            let x = 420;
            print("in queue: \(variable)");
            let model = self.download()
            
            DispatchQueue.main.async {
                print("main \(x)")
                self.label.text = "main \(x)"
                
                
                self.todoModel = model;
                // self.tableView.reloadData(); -> Hausübung
            }
        }
        
    }
    
    func download() -> TodoModel {
        let model = TodoModel();
        if let url = URL(string: path) {
            if let data = try? Data(contentsOf: url) {
                print("downloaded: \(data)");
                if let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]{ // [String: Any]: Dictionary
                    
                    for todo in obj {
                        let todoObj = Todo();
                        
                        todoObj.title = todo["title"] as! String;
                        todoObj.id = todo["id"] as! Int;
                        todoObj.userId = todo["userId"] as! Int;
                        todoObj.completed = todo["completed"] as! Bool;
                        
                        model.todos.append(todoObj);
                    }
                } else {
                    print("data parse failed")
                }
            } else {
                print("download failed");
            }
        }
        return model;
    }
}
