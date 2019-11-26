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
    let cityKey: String
}

struct CityModel {
    let city: CitySearchModel
    let temp: String
}


