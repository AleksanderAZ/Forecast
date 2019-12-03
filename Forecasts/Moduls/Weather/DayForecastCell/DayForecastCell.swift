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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(day: String, cloud: String, tempr: String) {
        self.day.text = day
        self.cloud.text = cloud
        self.tempr.text = tempr
    }
    
}
