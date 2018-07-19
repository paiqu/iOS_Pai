//
//  MatchTableCellTableViewCell.swift
//  Tap App
//
//  Created by Pai Qu on 7/5/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import UIKit

class MatchTableCell: UITableViewCell {

    @IBOutlet weak var matchImage: UIImageView!
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var matchIcon: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
