//
//  CityCell.swift
//  Forecasts
//
//  Created by Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var nameCity: UILabel!
    @IBOutlet weak var tempr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
