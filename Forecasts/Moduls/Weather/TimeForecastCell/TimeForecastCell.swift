//
//  TimeForecastCell.swift
//  Forecasts
//
//  Created by Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class TimeForecastCell: UITableViewCell {

    @IBOutlet weak var collectionTimeWeather: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        collectionTimeWeather.delegate = self
        collectionTimeWeather.dataSource = self
        collectionTimeWeather.register(UINib(nibName: "TimeForecastCollectionCell", bundle: nil), forCellWithReuseIdentifier: "TimeForecastCollectionCell")
        collectionTimeWeather.alwaysBounceHorizontal = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell() {
        
    }
}

extension TimeForecastCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeForecastCollectionCell", for: indexPath)
        if (collectionView.frame.size.height < cell.frame.size.height) {
                collectionView.frame.size.height = cell.frame.size.height
        }
        
        return cell
    }
}
