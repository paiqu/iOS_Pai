//
//  HomeViewController.swift
//  Tap App
//
//  Created by Pai Qu on 7/3/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var name1 = ""
    var name2 = ""
    
    @IBAction func beginGame(_ sender: Any) {
        name1 = p1Name.text!
        name2 = p2Name.text!
    }
    
    @IBOutlet weak var p1Name: UITextField!
    @IBOutlet weak var p2Name: UITextField!
    
    @IBAction func removeKB(_ sender: Any) {
        
        p1Name.resignFirstResponder()
        p2Name.resignFirstResponder()
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nxt = segue.destination as! ViewController
        nxt.NameP1 = name1
        nxt.NameP2 = name2
        
    }
 
    @IBOutlet weak var P1: UILabel!
    
}
