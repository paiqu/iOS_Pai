//
//  DoubleTextTableCellTableViewCell.swift
//  Tap App
//
//  Created by Pai Qu on 7/9/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class DoubleTextTableCellTableViewCell: UITableViewCell {

    
  
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var numberOfWinsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
