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
    var timer: Timer? = Timer()
    
    @IBOutlet weak var tableView: UITableView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initNotificationSetupCheck()
//        clearInfo()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "match", for: indexPath) as! CustomTableViewCell
        let item = taskList[indexPath.row]
        
        cell.taskName.text = item.name
        cell.progressBar.value = CGFloat(getProgressValue(item.name))
        cell.progressBar.outlineWidth = 2
        let totalTime: Int = totalSecondsDiff(fromDate: item.dateBegin, toDate: item.dateFinish)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
            self.updateCell(cell: cell, item: item, time: totalTime)
        }
        return cell
    }
    
    func updateCell(cell: CustomTableViewCell, item: info, time: Int){
        let currentDate: Date = Date()
        let timeLeft: String = item.dateFinish.offsetFrom(date: currentDate)
        
        cell.timeLeft.text = timeLeft
        cell.progressBar.value += CGFloat(1/Double(time))
        saveProgressValue(Double(cell.progressBar.value), key: String(item.name))
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            clearProgressValue(taskList[indexPath.row].name)
            removeTaskList(index: indexPath.row)
            
            self.taskList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func totalSecondsDiff(fromDate: Date, toDate: Date) -> Int{
        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: fromDate, to: toDate);
        
        let seconds = difference.second ?? 0
        let minutes = difference.minute ?? 0
        let hours = difference.hour ?? 0
        let days = difference.day ?? 0
        let months = difference.month ?? 0
        let output: Int = seconds + minutes*60 + hours*60*60 + days*24*60*60 + months*30*24*60*60
        
        return output
    }
    
   
  
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        taskList = getTaskList()
        print(taskList)
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

