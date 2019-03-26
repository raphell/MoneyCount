//
//  basicPersonTableViewCell.swift
//  MoneyCount
//
//  Created by Raphael LUCIANO on 26/03/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class basicPersonTableViewCell: UITableViewCell {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
