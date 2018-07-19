//
//  playerInfoPageViewController.swift
//  Tap App
//
//  Created by Pai Qu on 7/11/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class playerInfoPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        playerName.text = playerNameText
        playerImageView.image = playerImage
        // Do any additional setup after loading the view.
    }
    
    var playerNameText = ""
    var playerImage: UIImage = UIImage()

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
