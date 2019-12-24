//
//  CityModel.swift
//  Forecasts
//
//  Created by Z on 11/14/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

struct CitySearchModel {
    let cityName: String
    let countryName: String
    let cityKey: String
}

struct CityModel {
    let city: CitySearchModel
    var tempr: String
    var link: String
    var icon: String
    
    init(city: CitySearchModel) {
        self.city = city
        tempr = ""
        link = ""
        icon = ""
    }
}


