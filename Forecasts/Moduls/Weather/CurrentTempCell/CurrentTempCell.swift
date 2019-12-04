//
//  CurrentTempCell.swift
//  Forecasts
//
//  Created by Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class CurrentTempCell: UITableViewCell {
    @IBOutlet weak var temprLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(tempr: String) {
        self.temprLabel.text = tempr + " tº"
    }
}
