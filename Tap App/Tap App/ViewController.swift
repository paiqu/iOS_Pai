//
//  ViewController.swift
//  Tap App
//
//  Created by Pai Qu on 7/2/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Score1.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        p1win.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        P1info.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        P1info.text = NameP1
        p2info.text = NameP2
        
        
    }
    var tapCount1: Int = 0
    var tapCount2: Int = 0
    var p1score: Int = 0
    var p2score: Int = 0
    var player: AVAudioPlayer = AVAudioPlayer()
    var NameP1: String = "Player 1"
    var NameP2: String = "Player 2"
    

    
    func reset(){
        tapCount1 = 0
        tapCount2 = 0
        Score1.text = "0"
        Score2.text = "0"
        
    }
    let feedbackGenerator = UINotificationFeedbackGenerator()
    
    
    @IBAction func Button1(_ sender: Any) {
        playSound(named: "coin")
        tapCount1 += 1
        Score1.text = "\(tapCount1)"
        feedbackGenerator.notificationOccurred(UINotificationFeedbackType.success)
        
        if tapCount1 >= 10 {

            p1score += 1
            p1win.text = "Score: \(p1score)"
            performSegue(withIdentifier: "win", sender: self)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reset()
    }
    @IBAction func Button2(_ sender: Any) {
        playSound(named: "click")
        tapCount2 += 1
        Score2.text = "\(tapCount2)"
        feedbackGenerator.notificationOccurred(UINotificationFeedbackType.success)
        
        if tapCount2 >= 10 {
            p2score += 1
            p2win.text = "Score: \(p2score)"
            
            performSegue(withIdentifier: "win", sender: self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! victoryViewController
        if tapCount1 > tapCount2 {
            vc.player1win = true
            vc.winner = "1"
            vc.p = NameP1
            vc.sender = self

        }else{
            vc.player2win = true
            vc.winner = "2"
            vc.p = NameP2
            vc.sender = self
        }
        
    }
    
    func playSound(named soundName: String){
       
        let soundURL = Bundle.main.path(forResource: soundName, ofType: "mp3")
        player = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: soundURL!) as URL, fileTypeHint:AVFileType.mp3.rawValue)
        player.stop()
        player.play()
        
        
    }
    @IBOutlet weak var Score1: UILabel!
    @IBOutlet weak var Score2: UILabel!
    @IBOutlet weak var p1win: UILabel!
    @IBOutlet weak var p2win: UILabel!
    @IBOutlet weak var P1info: UILabel!
    @IBOutlet weak var p2info: UILabel!
}

