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
        self.tempr.text = tempr + " Cº"
        ImageLoader.load(for: self.imageDay, icon: icon) { () in
           DispatchQueue.main.async {
            if let _ = self.imageDay.image {
                self.cloud.isHidden = true
            }
            else {
                self.cloud.text = cloud
                self.imageDay.isHidden = true
            }
           }
        }
    }
}
