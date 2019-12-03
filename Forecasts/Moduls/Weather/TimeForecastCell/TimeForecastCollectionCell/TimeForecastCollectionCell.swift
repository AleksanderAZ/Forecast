//
//  TimeForecastCollectionCell.swift
//  Forecasts
//
//  Created by Z on 11/6/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class TimeForecastCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var temprLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(hour: String, cloud: String, tempr: String) {
        hourLabel.text = hour
        cloudLabel.text = cloud
        temprLabel.text = tempr
    }
}
