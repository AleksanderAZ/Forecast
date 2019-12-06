//
//  TimeForecastCell.swift
//  Forecasts
//
//  Created by Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class TimeForecastCell: UITableViewCell {
    
    var presenter: WeatherPresenterProtocol?
    
    @IBOutlet weak var collectionTimeWeather: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionTimeWeather.delegate = self
        collectionTimeWeather.dataSource = self
        collectionTimeWeather.register(UINib(nibName: "TimeForecastCollectionCell", bundle: nil), forCellWithReuseIdentifier: "TimeForecastCollectionCell")
        collectionTimeWeather.alwaysBounceHorizontal = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(presenter: WeatherPresenterProtocol?) {
        self.presenter = presenter
        self.collectionTimeWeather.reloadData()
    }
}

extension TimeForecastCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.countHour() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeForecastCollectionCell", for: indexPath)

        if let cell = cell as? TimeForecastCollectionCell {
            let hourDate = self.presenter?.getHour(index: indexPath.item)
            let hour = hourDate?.hour ?? ""
            let cloud = hourDate?.iconPhrase ?? ""
            let tempr = hourDate?.tempr ?? ""
            let icon = hourDate?.icon ?? ""
            cell.configCell(hour: hour, cloud: cloud, tempr: tempr, icon: icon)
        }
        
        return cell
    }
}
