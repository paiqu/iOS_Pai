//
//  ProfileViewController.swift
//  TrackApp
//
//  Created by Pai Qu on 7/17/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import YXWaveView
import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var quitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init Avatar OverView
        let avatarFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let avatarView = UIImageView(frame: avatarFrame)
        avatarView.layer.cornerRadius = avatarView.bounds.height/2
        avatarView.layer.masksToBounds = true
        avatarView.layer.borderColor  = UIColor.white.cgColor
        avatarView.layer.borderWidth = 3
        avatarView.layer.contents = UIImage(named: "Pai")?.cgImage
        avatarView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 200)
        
        let waterView = YXWaveView(frame: frame, color: UIColor.white)

        
        waterView.addOverView(avatarView)
        waterView.backgroundColor = UIColor(red: 26/255, green: 48/255, blue: 68/255, alpha: 1)
        
        // Add WaveView
        self.view.addSubview(waterView)
        self.view.addSubview(quitButton)
        
        // Start wave
        waterView.start()
        // Do any additional setup after loading the view.
    }

    @IBAction func quitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
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
