//
//  addTaskViewController.swift
//  TrackApp
//
//  Created by Pai Qu on 7/18/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit
import YXWaveView
import UserNotifications

class addTaskViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 200)
        
        let waterView = YXWaveView(frame: frame, color: UIColor.white)
        waterView.backgroundColor = UIColor(red: 26/255, green: 48/255, blue: 68/255, alpha: 1)
    
        // Add WaveView
        self.view.addSubview(waterView)
        self.view.addSubview(quitButton)
        
        // Start wave
        waterView.start()
        
        
        let currentDate = NSDate()
        datePicker.minimumDate = currentDate as Date
        datePicker.date = currentDate as Date
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func quitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var taskList = getTaskList()
    
    @IBAction func addButton(_ sender: Any) {
        //data
        let formatter = DateFormatter()
        formatter.calendar = datePicker.calendar
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
//        let dateString = formatter.string(from: datePicker.date)
//        print(dateString)
        
        let name: String = nameText.text!
        let currentDate = Date()
        let finishDate: Date = datePicker.date
        let item = info(name: name, dateBegin: currentDate, dateFinish: finishDate)
        
        save2TaskList(obj: item)
        taskList = getTaskList()
        
        print(taskList)

        
        
        
        
        
        
        //notification
        let notification = UNMutableNotificationContent()
        notification.title = "Danger Will Robinson"
        notification.subtitle = "Something This Way Comes"
        notification.body = "I need to tell you something, but first read this."
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    
    
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
