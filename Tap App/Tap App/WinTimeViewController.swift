//
//  WinTimeViewController.swift
//  Tap App
//
//  Created by Pai Qu on 7/9/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class WinTimeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var sortedList = [(key: String, value: Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerDict = listToDic(lst: winners)
        
        sortedList = winnerDict.sorted(by: {$1.value < $0.value} )
       
       
    }
    var keys = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedList.count
    }
    
    var winners: [String] = getWinnerList()
    var winnerDict = [String:Int]()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "doubleText", for: indexPath) as! DoubleTextTableCellTableViewCell
        
        
        
        cell.playerNameLabel.text = sortedList[indexPath.row].key
        cell.numberOfWinsLabel.text = String(sortedList[indexPath.row].value)
        
        
        return cell
    }
    
    
   
    @IBAction func quitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        winners = getWinnerList()
        winnerDict = listToDic(lst: winners)
        
        sortedList = winnerDict.sorted(by: {$1.value < $0.value} )
        self.tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
