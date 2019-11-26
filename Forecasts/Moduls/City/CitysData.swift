//
//  CitysData.swift
//  Forecasts
//
//  Created by Z on 11/26/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

class CitysData {
    var  citys = [CityModel]()
    
    static let shared = CitysData()
    
    private init() {
    }
}
