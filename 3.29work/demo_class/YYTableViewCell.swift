//
//  YYTableViewCell.swift
//  zzz
//
//  Created by gjh on 2019/3/29.
//  Copyright © 2019 gjh. All rights reserved.
//

import UIKit

class YYTableViewCell: UITableViewCell {

    
    @IBOutlet weak var centerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
