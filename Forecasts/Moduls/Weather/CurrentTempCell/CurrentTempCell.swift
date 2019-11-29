//
//  CurrentTempCell.swift
//  Forecasts
//
//  Created by Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class CurrentTempCell: UITableViewCell {

    var presenter: WeatherPresenterProtocol?
    
    @IBOutlet weak var temprLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell() {
        self.temprLabel.text = self.presenter?.getCityTempr()
    }
}
