//
//  AdditionInfoCell.swift
//  Forecasts
//
//  Created by Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class AdditionInfoCell: UITableViewCell {
    
    @IBOutlet weak var infoFirstLabel: UILabel!
    @IBOutlet weak var infoSecondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(textFirst: String, textSecond: String) {
        infoFirstLabel.text = textFirst
        infoSecondLabel.text = textSecond
    }
}
