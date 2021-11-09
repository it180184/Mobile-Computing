class Model {
    var randomNumber = 0
    var guessCount = 0
    var lowerBound = 1
    var upperBound = 99
    var guesses: [Int] = []
    // var didReset = false
    
    func reset() {
        randomNumber = .random(in: lowerBound...upperBound);
        guessCount = 0
        guesses = []
        // didReset = true
    }
    
    func evaluate (string: String!) -> Int! {
        return evaluate(Int(string)!)
        
    }
    
    func evaluate (_ guess: Int) -> Int! {
        return (guess - randomNumber).signum()
    }
    
    func isValidGuess (_ string: String?) -> Bool {
        let x: Int = Int(string ?? "") ?? -1
        return x >= lowerBound && x <= upperBound
    }
    
    /*func checkGuess(_ guess: Int) -> String {
        let messageText: String
        
        if guess > 100 || guess < 1 {
            messageText = "Invalid guess"
        } else {
            guessCount += 1
            if guess == randomNumber {
                messageText = "You guessed the number in \(guessCount) guesses"
                reset()
            } else if guess > randomNumber {
                messageText = "\(guess) is bigger than the number"
            } else {
                messageText = "\(guess) is smaller than the number"
            }
        }
        
        return messageText
    }*/
}
