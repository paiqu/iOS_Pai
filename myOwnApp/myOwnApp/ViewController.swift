//
//  ViewController.swift
//  myOwnApp
//
//  Created by Pai Qu on 7/12/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var buttons: [UIButton] = []
    var gestures: [UIPanGestureRecognizer] = []
    
    
    @IBOutlet weak var buttonContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_ in
            self.updateCurrentDate()
            self.updateCurrentTime()
            
        }
        
        buttons = [topLeftButton, topRightButton, bottomLeftButton, bottomRightButton]

//        buttonContainerView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        topRightButton.setImage(#imageLiteral(resourceName: "Top Right Highlighted"), for: .highlighted)
        topLeftButton.setImage(#imageLiteral(resourceName: "Top Left Highlighted"), for: .highlighted)
        bottomRightButton.setImage(#imageLiteral(resourceName: "Bottom Right Highlighted"), for: .highlighted)
        bottomLeftButton.setImage(#imageLiteral(resourceName: "Bottom Left Highlighted"), for: .highlighted)
        for button in buttons{
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.draggedView(_:)))
            gestures.append(panGesture)
            button.addGestureRecognizer(panGesture)
        }
    }
    
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        let index = gestures.index(of: sender)!
        let button = buttons[index]
        
        let translation = sender.translation(in: self.buttonContainerView)
        button.center = CGPoint(x: button.center.x + translation.x, y:button.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.buttonContainerView)
    }
   
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    @IBAction func tapButton(_ sender: UIButton) {
        print("tap button")
    }
    
    func updateCurrentDate(){
        //create a date for specific time
        let date: Date = Date()
        
        // Create a formatter to convert a timestamp into text
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        // Get the text from a specific date
        let dateText = dateFormatter.string(from: date)
        
        dateLabel.text = dateText
    }
    
    func updateCurrentTime(){
        
        //create a date for specific time
        let date: Date = Date()
        
        // Create a formatter to convert a timestamp into text
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = .medium
        // Get the text from a specific date
        let dateText = dateFormatter.string(from: date)
        
        timeLabel.text = dateText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //UIApplication.shared.statusBarStyle = .lightContent
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

}

