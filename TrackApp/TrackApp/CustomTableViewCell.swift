//
//  CustomTableViewCell.swift
//  TrackApp
//
//  Created by Pai Qu on 7/16/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit
import TCProgressBar

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var progressBar: TCProgressBar!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
}
