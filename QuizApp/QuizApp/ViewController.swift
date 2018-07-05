//
//  ViewController.swift
//  QuizApp
//
//  Created by Pai Qu on 7/4/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    let feedbackGenerator = UINotificationFeedbackGenerator()
    
    
    var answer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttons: [UIButton] = [Button1, Button2, Button3]
        for button in buttons {
            configureButton(Button: button)
        }
        answer = (Button1.titleLabel?.text)!
    }
    
    @IBAction func typeButton(_ sender: UIButton) {
        
        
        let alert = UIAlertController(title: "Yeah", message: "Correct Answer.", preferredStyle: .alert)
    
        UIView.animate(withDuration: 0.1){
            sender.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            sender.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        })
            {(completed) in
                if(sender == self.Button1){
                    self.feedbackGenerator.notificationOccurred(.success)
                    alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
                    print("Correct Answer")
                }else{
                    self.feedbackGenerator.notificationOccurred(.error)
                    alert.addAction(UIAlertAction(title: "continue", style: .default, handler: { _ in
                        NSLog("The \"continue\" alert occured.")
                    }))
                    alert.title = "No"
                    alert.message = "You are wrong"
                    self.present(alert, animated: true, completion: nil)
                    print("You are wrong")
            
    
        }
        
        
        
        }
    
        
        
        
    }
  
    func configureButton(Button: UIButton){
        Button.layer.cornerRadius = Button.frame.size.height/2
        Button.layer.borderWidth = 2
        Button.layer.borderColor = UIColor.blue.cgColor
    }

    

}

