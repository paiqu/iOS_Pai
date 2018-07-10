//
//  victoryViewController.swift
//  Tap App
//
//  Created by Pai Qu on 7/2/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class victoryViewController: UIViewController {

    var sender: UIViewController!
    var player1win = false
    var player2win = false
    var winner = ""
    var p: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        win.text = "Player " + winner + " win"
        if winner == "1" {
            win.text = p + " win"
            //view.backgroundColor = .blue
            buttonQuit.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1.0).cgColor
            buttonQuit.layer.borderWidth = 1.0
            buttonRestart.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1.0).cgColor
            buttonRestart.layer.borderWidth = 1.0
            //
            saveWinnerName(name: p)
            //
            
            
            
        }
        if winner == "2"{
            win.text = p + " win"
            view.backgroundColor = .yellow
            textWinner.textColor = .black
            textVictory.textColor = .black
            buttonQuit.setTitleColor(.black, for: .normal)
            buttonRestart.setTitleColor(.black, for: .normal)
            
            buttonRestart.layer.borderColor = UIColor.black.cgColor
            buttonRestart.layer.borderWidth = 1.0
            
            buttonQuit.layer.borderColor = UIColor.black.cgColor
            buttonQuit.layer.borderWidth = 1.0
            //
            saveWinnerName(name: p)
            //
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func restart1(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func quitGame(_ sender: Any) {
        
        dismiss(animated: false, completion: {
            self.sender.dismiss(animated: false, completion: nil)
        })
        
    }
    
  
    @IBOutlet weak var textVictory: UILabel!
    @IBOutlet weak var textWinner: UILabel!
    @IBOutlet weak var buttonRestart: UIButton!
    @IBOutlet weak var buttonQuit: UIButton!
    
    @IBOutlet weak var win: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
   
    

}
