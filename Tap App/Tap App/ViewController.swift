//
//  ViewController.swift
//  Tap App
//
//  Created by Pai Qu on 7/2/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    var tapCount1: Int = 0
    var tapCount2: Int = 0
    var p1score: Int = 0
    var p2score: Int = 0
    
    func reset(){
        tapCount1 = 0
        tapCount2 = 0
        Score1.text = "0"
        Score2.text = "0"
        
    }
    @IBAction func Button1(_ sender: Any) {
        tapCount1 += 1
        Score1.text = "\(tapCount1)"
        if tapCount1 >= 10 {
            p1score += 1
            p1win.text = "Score: \(p1score)"
            performSegue(withIdentifier: "win", sender: self)
            reset()
        }
    }
    
    @IBAction func Button2(_ sender: Any) {
        tapCount2 += 1
        Score2.text = "\(tapCount2)"
        if tapCount2 >= 10 {
            p2score += 1
            p2win.text = "Score: \(p2score)"
            
            performSegue(withIdentifier: "win", sender: self)
            reset()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! victoryViewController
        if tapCount1 > tapCount2 {
            vc.player1win = true
            vc.winner = "1"

        }else{
            vc.player2win = true
            vc.winner = "2"
        }
        
    }
    @IBOutlet weak var Score1: UILabel!
    @IBOutlet weak var Score2: UILabel!
    @IBOutlet weak var p1win: UILabel!
    @IBOutlet weak var p2win: UILabel!
}

