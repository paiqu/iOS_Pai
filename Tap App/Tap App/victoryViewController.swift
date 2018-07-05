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
        }
        if winner == "2"{
            win.text = p + " win"
            view.backgroundColor = .yellow
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
    
  
    
    @IBOutlet weak var win: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
   
    

}
