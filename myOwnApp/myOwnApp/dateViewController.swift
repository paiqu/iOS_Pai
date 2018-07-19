//
//  dateViewController.swift
//  myOwnApp
//
//  Created by Pai Qu on 7/13/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class dateViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_ in
            self.updateCurrentDate()
            self.updateCurrentTime()
        }
        
        

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
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    var timerStop = false
    var hour = 0
    var minute = 0
    var second = 0
    var countTimer: Timer!
    @IBOutlet weak var startButton: UIButton!
    @IBAction func startButton(_ sender: Any) {
        startButton.isEnabled = false
        countTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_ in
            
            if self.second == 59{
                self.minute += 1
                self.second = 0
            }
            
            if self.minute == 59{
                self.hour += 1
                self.minute = 0
            }
            
            let hourText = self.configureTime(time: self.hour)
            let minuteText = self.configureTime(time: self.minute)
            let secondText = self.configureTime(time: self.second)
            
            self.second += 1
            
            self.counterLabel.text =
                hourText+":" +
                minuteText + ":" + secondText
            
            print(self.second)
        }
    }
    
    func configureTime(time: Int) -> String{
        var text = String(time)
        if time < 10 {
            text = "0" + String(time)
        }
        return text
        
     
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        countTimer.invalidate()
        startButton.isEnabled = true
    }
    func updateCurrentCount(){
        
    }
    @IBAction func resetButton(_ sender: Any) {
        startButton.isEnabled = true
        countTimer.invalidate()
        hour = 0
        minute = 0
        second = 0
        self.counterLabel.text = "00"+":"+"00"+":"+"00"

        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

