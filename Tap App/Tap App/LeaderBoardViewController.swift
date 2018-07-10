//
//  LeaderBoardViewController.swift
//  Tap App
//
//  Created by Pai Qu on 7/5/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class LeaderBoardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var tableView: UITableView!

    var winners = getWinnerList()
    
    @IBAction func mainMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return winners.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "match", for: indexPath) as! MatchTableCell
        
        cell.contentView.backgroundColor = UIColor.white
        
        configureIcon(pic: cell.matchIcon)
        
        cell.textLabel?.text = winners[indexPath.row]
        
        if cell.textLabel?.text == "Pai"{
            cell.matchImage.image = #imageLiteral(resourceName: "Pai")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if winners[indexPath.row] == "Pai" {
            let alert = UIAlertController(title: "You", message: "Win", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        print("tap cell \(indexPath.row)")
    }
    var animationShown : [Bool]?

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            self.winners.remove(at: indexPath.row)
            removeWinnerName(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
  
    @IBAction func clearButton(_ sender: Any) {
        clearInfo()
        tableView.isScrollEnabled = false
        var x: Double = 0.1
        for cell in tableView.visibleCells as! [MatchTableCell] {
            UIView.animate(withDuration: 0.3, delay: x , options: UIViewAnimationOptions.curveEaseInOut, animations: {
                cell.textLabel?.alpha = 0
                cell.matchImage.superview?.alpha = 0
                //self.cell.reloadData()
            }, completion: nil)
            x = x + 0.2
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + x, execute: {
            self.winners = getWinnerList()
            self.tableView.reloadData()
            self.tableView.isScrollEnabled = true
        })
        
    }

    func configureIcon(pic: UIView){
        pic.layer.cornerRadius = 15/*pic.frame.size.height/2*/
        pic.clipsToBounds = true
    }
 

}
