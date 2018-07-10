//
//  ViewController.swift
//  SimonGame
//
//  Created by Pai Qu on 7/10/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        blueButton.backgroundColor = UIColor.blue
        redButton.backgroundColor = .red
        orangeButton.backgroundColor = .orange
        yellowButton.backgroundColor = .yellow
        buttons = [blueButton, redButton, orangeButton, yellowButton]
        for button in buttons{
            button.layer.cornerRadius = 20
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = CGSize(width: 0, height: 1)
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.1
        }
    }
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    var buttons: [UIButton] = []
    var numberOfTaps = 0
    var pattern = [1,2,3,1,1,4,2,3]
    var userSequence: [Int] = []
    func presentNextSequence(){
        numberOfTaps += 1
        if numberOfTaps > pattern.count{
            return
        }
        for i in 0..<numberOfTaps{
            let buttonIndexTap = pattern[i]
            let button = buttons[buttonIndexTap]
            button.isHighlighted = true
        }
    }
    @IBAction func tapButton(_ sender: UIButton) {
        if sender == blueButton{
            userSequence.append(0)
        }
        if sender == redButton{
            userSequence.append(1)
        }
        if sender == orangeButton{
            userSequence.append(2)
        }
        if sender == yellowButton{
            userSequence.append(3)
        }
        if userSequence.count == numberOfTaps{
            
        }
        print(userSequence)
        print("Button Tapped")
    }
    
    
    
    
    
    
    
    
    
  
    
}

