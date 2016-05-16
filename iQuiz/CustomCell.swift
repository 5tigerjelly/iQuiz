//
//  CustomCell.swift
//  iQuiz
//
//  Created by iGuest on 5/1/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var photo: UIImageView!
    @IBOutlet var Title: UILabel!
    @IBOutlet var Desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
