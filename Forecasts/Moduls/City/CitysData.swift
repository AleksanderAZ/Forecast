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
    var  citysSearch = [CitySearchModel]()
    let quantityMax = 5
    
    static let shared = CitysData()
    
    private init() {
    }
    
    func saveUserDef(save: [CityModel]) {
        var quantity = self.quantityMax
        
        if save.count < quantity {
            quantity = save.count
        }
        
        for i in 0..<quantity {
            UserDefaults.standard.set(save[i].city.cityName, forKey: "forecastcity" + String(i))
            UserDefaults.standard.set(save[i].city.cityKey, forKey:  "forecastkey" + String(i))
            UserDefaults.standard.set(save[i].city.countryName, forKey:  "forecastcountry" + String(i))
        }
    }
    
    func getUserDef()->[CitySearchModel] {
        let quantity = self.quantityMax
        var cityDef = [CitySearchModel]()
        
        for i in 0..<quantity {
            guard let cityName = UserDefaults.standard.string(forKey: "forecastcity" + String(i)) else { return cityDef}
            guard let cityKey = UserDefaults.standard.string(forKey: "forecastkey" + String(i)) else { return cityDef}
            guard let countryName = UserDefaults.standard.string(forKey: "forecastcountry" + String(i)) else { return cityDef}
            cityDef.append(CitySearchModel(cityName: cityName, countryName: countryName, cityKey: cityKey))
        }
        return cityDef
    }
}
