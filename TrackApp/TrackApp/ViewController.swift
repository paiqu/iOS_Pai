//
//  ViewController.swift
//  TrackApp
//
//  Created by Pai Qu on 7/16/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var taskList = getTaskList()
    @IBOutlet weak var tableView: UITableView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initNotificationSetupCheck()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "match", for: indexPath) as! CustomTableViewCell
        let item = taskList[indexPath.row]
        cell.progressBar.outlineWidth = 2
        
        let currentDate = Date()
        
        
        cell.taskName.text = item.name
        
        
        var secondsPast: Double = Double(currentDate.seconds(from: item.dateBegin))
        
        var secondsTotal: Double = Double(item.dateFinish.seconds(from: item.dateBegin))
        var timeLeft = item.dateFinish.offset(from: currentDate)
        cell.timeLeft.text = timeLeft
        cell.progressBar.value = CGFloat(secondsPast / secondsTotal)
        
       
        secondsPast = Double(currentDate.seconds(from: item.dateBegin))
        secondsTotal = Double(item.dateFinish.seconds(from: item.dateBegin))
        timeLeft = item.dateFinish.offset(from: currentDate)
        cell.timeLeft.text = timeLeft
        cell.progressBar.value = CGFloat(secondsPast / secondsTotal)
        
        
        
        
//        print(secondsPast / secondsTotal)
        
        return cell
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        taskList = getTaskList()
        self.tableView.reloadData()
    }
    func initNotificationSetupCheck() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert])
        { (success, error) in
            if success {
                print("Permission Granted")
            } else {
                print("There was a problem!")
            }
        }
    }


}

