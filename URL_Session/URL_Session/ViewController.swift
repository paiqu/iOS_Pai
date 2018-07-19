//
//  ViewController.swift
//  URL_Session
//
//  Created by Pai Qu on 7/17/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //parser for JSON
    //JSON: Jave Script Object Notation
    
    func parseJSON(){
        let url = URL(string: "www.baidu.com")
        
        let task = URLSession.shared.dataTask(with: url){
            (data, response, error) in
        }
        
        guard error == nil else{
            print("return error")
            return
        }
        
        guard let content = else{
            print("no data")
        }
    }
}

