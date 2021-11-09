//
//  ViewController.swift
//  NumberGuessing
//
//  Created by Ettinger Fabian on 28.09.21.
//

import UIKit

class ViewController: UIViewController {

    var randomNumber: Int = 0
    var guessCount: Int = 0
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int.random(in: 1...100)
        message.text = "Guess a number from 1 to 100"
        image.isHidden = true
    }

    
    @IBAction func onTouchUpInside(_ sender: UIButton) {
        let guess: Int = Int(userInput.text!)!
        
        let messageText: String
        guessCount += 1
        if guess > 100 || guess < 1 {
            messageText = "Invalid guess"
            image.isHidden = true
            guessCount -= 1
        } else if guess == randomNumber {
            messageText = "You guessed the number in \(guessCount) guesses"
            image.isHidden = false
            guessCount = 0
            randomNumber = Int.random(in: 1...100)
        } else if guess > randomNumber {
            messageText = "\(guess) is bigger than the number"
            image.isHidden = true
        } else {
            messageText = "\(guess) is smaller than the number"
            image.isHidden = true
        }
        
        message.text = messageText;
    }
}

