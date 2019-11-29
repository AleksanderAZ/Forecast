//
//  AdditionInfoCell.swift
//  Forecasts
//
//  Created by Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class AdditionInfoCell: UITableViewCell {

    var presenter: AdditionInfoCellProtocol?
    
    @IBOutlet weak var addInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(index: Int) {
        addInfoLabel.text = presenter?.getAddInfo(index: index)
    }
}
