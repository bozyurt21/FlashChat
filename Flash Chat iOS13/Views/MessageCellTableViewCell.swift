//
//  MessageCellTableViewCell.swift
//  Flash Chat iOS13
//
//  Created by Bensu Özyurt on 2.09.2025.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

class MessageCellTableViewCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var messageText: UILabel!
    
    @IBOutlet weak var personalIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
