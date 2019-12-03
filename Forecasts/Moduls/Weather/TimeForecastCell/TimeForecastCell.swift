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
        
       // self.frame.size.height = 400
        //collectionTimeWeather.frame.size.height = 380
        //collectionLayout.estimatedItemSize.height = 380
       // collectionLayout.itemSize.height = 200
        
        
        
        collectionTimeWeather.delegate = self
        collectionTimeWeather.dataSource = self
        collectionTimeWeather.register(UINib(nibName: "TimeForecastCollectionCell", bundle: nil), forCellWithReuseIdentifier: "TimeForecastCollectionCell")
        collectionTimeWeather.alwaysBounceHorizontal = true

        //self.frame.size.height = 400
        //collectionTimeWeather.frame.size.height = 380
        //collectionLayout.estimatedItemSize.height = cell.frame.size.height + 8
        print("-2-Layout--", collectionLayout.estimatedItemSize.height)
        print("--tableCell--", self.frame.size.height)
        print("--collectionView--", collectionTimeWeather.frame.size.height)
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
            let cloud = hourDate?.icon ?? ""
            let tempr = hourDate?.temp ?? ""
            cell.configCell(hour: hour, cloud: cloud, tempr: tempr)
        }
        
        if (self.frame.size.height < cell.frame.size.height) {
            //self.frame.size.height = cell.frame.size.height + 32
            //collectionView.frame.size.height = cell.frame.size.height + 16
            //collectionLayout.estimatedItemSize.height = cell.frame.size.height + 8
            print("-3-Layout--", collectionLayout.estimatedItemSize.height)
            print("--tableCell--", self.frame.size.height)
            print("--collectionView--", collectionTimeWeather.frame.size.height)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 120, height: 120)
        
        return size
    }
}
