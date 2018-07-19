//
//  ViewController.swift
//  Axiom Simon Says
//
//  Created by Julien Saad on 2018-07-10.
//  Copyright © 2018 Axiom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var payAttentionLabel: UILabel!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var scoreBoard: UILabel!
    
    var pattern: [Int] = []
    var buttons: [UIButton] = []
    var userSequence: [Int] = []
    var numberOfTaps = 0
    var highScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        buttons = [greenButton, redButton, orangeButton, blueButton]

        for button in buttons {
            button.layer.cornerRadius = 50
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = CGSize(width: 0, height: 1)
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.1
        }
        self.scoreBoard.text = "\(highScore)"
        presentNextSequence()
    }

    func presentNextSequence() {
        numberOfTaps = numberOfTaps + 1
        
        let newRandomNumber = Int(arc4random()) % buttons.count
        pattern.append(newRandomNumber)
        
        payAttentionLabel.text = "Pay Attention!"
        
        if numberOfTaps > pattern.count {
            showVictoryScreen()
            return
        }
        
        for button in buttons {
            button.isUserInteractionEnabled = false
        }

        let baseDelay = 2
        for i in 0..<numberOfTaps {
            let buttonIndexToTap = pattern[i]
            let button = buttons[buttonIndexToTap]

            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i + baseDelay)) {
                button.isHighlighted = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) + Double(baseDelay) + 0.5) {
                button.isHighlighted = false
            }
        }


        DispatchQueue.main.asyncAfter(deadline: .now() + Double(numberOfTaps) + Double(baseDelay)) {
            self.payAttentionLabel.text = "Your turn!"
            for button in self.buttons {
                button.isUserInteractionEnabled = true
            }
        }

    }

    func restartGame(){
        pattern = []
        userSequence = []
        numberOfTaps = 0
        currentScoreLabel.text = "Current Score: " + String(0)
        
        presentNextSequence()
        
    }

    @IBAction func tapButton(_ sender: UIButton) {

        if sender == greenButton {
            userSequence.append(0)
        }
        else if sender == redButton {
            userSequence.append(1)
        }
        else if sender == orangeButton {
            userSequence.append(2)
        }
        else {
            userSequence.append(3)
        }

        if userSequence.count == numberOfTaps {
            validateSequence()
            userSequence = []
            currentScoreLabel.text = "Current Score: " + String(numberOfTaps - 1)
        }
    }

    func validateSequence() {
        for index in 0..<numberOfTaps {
            if userSequence[index] != pattern[index] {
                // Show failure!
                // You lose!
                showDefeatScreen()
                return
            }
        }
        presentNextSequence()
    }

    func showVictoryScreen() {
        let alert = UIAlertController(title: "You won! 👑", message: "Wow, you have the memory of an elephant 🐘", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Yay!", style: .default, handler: nil)
  
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func showDefeatScreen() {
        let alert = UIAlertController(title: "You lost.", message: "Sorry, try again!", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Restart", style: .default){_ in
            if self.numberOfTaps > self.highScore {
                self.highScore = self.numberOfTaps - 1
                self.scoreBoard.text = "\(self.highScore)"
            }
            self.restartGame()
            print("Restatatetat")
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

