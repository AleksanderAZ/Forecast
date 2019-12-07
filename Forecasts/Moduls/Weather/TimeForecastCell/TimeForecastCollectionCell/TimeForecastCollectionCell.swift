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
    @IBOutlet weak var imageHour: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(hour: String, cloud: String, tempr: String, icon: String) {
        hourLabel.text = hour
        temprLabel.text = tempr + " Cº"
        ImageLoader.load(for: self.imageHour, icon: icon) { () in
           DispatchQueue.main.async {
            if let _ = self.imageHour.image {
                self.cloudLabel.isEnabled = false
            }
            else {self.cloudLabel.text = cloud
            }
           }
        }
    }
}
