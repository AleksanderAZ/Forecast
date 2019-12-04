//
//  DayForecastCell.swift
//  Forecasts
//
//  Created by Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class DayForecastCell: UITableViewCell {
    @IBOutlet weak var tempr: UILabel!
    @IBOutlet weak var cloud: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var imageDay: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(day: String, cloud: String, tempr: String, icon: String) {
        self.day.text = day
        self.cloud.text = " "
        self.tempr.text = tempr + " Cº"
        (LoadImage(imageView: self.imageDay, icon: icon)).load()
    }
}
