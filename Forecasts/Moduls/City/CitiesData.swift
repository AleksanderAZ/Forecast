//
//  CitysData.swift
//  Forecasts
//
//  Created by Z on 11/26/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

struct Key: RawRepresentable {
    let rawValue: String
}

extension Key: ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        rawValue = stringLiteral
    }
}

extension Key {
    static let citiesFavorite: Key = "citysFavorite"
}

protocol PropertyListValue {}
extension String: PropertyListValue {}
extension Data: PropertyListValue {}
extension Dictionary: PropertyListValue where Key == String, Value: PropertyListValue {}
extension Array: PropertyListValue where Element: PropertyListValue {}

struct CitiesUserDefault<T: PropertyListValue> {
    let key: Key
    private let userDef = UserDefaults.standard
    init(key: Key){
        self.key = key
    }
    
    var wrappedValue: T? {
        get { return userDef.value(forKey: key.rawValue) as? T }
        set { userDef.set(newValue, forKey: key.rawValue) }
    }
}

struct CityStorage {
    var cityiesUserDefault = CitiesUserDefault<[String: String]>(key: Key.citiesFavorite)
}

class CitiesData {
    
    func saveUserDef(save: [CityModel]) {
        var citysStorage = CityStorage()
        var saveDictionery = [String: String]()
        
        for item in save {
            let key = item.city.cityKey
            let name = item.city.cityName
            saveDictionery[key] = name
        }
        citysStorage.cityiesUserDefault.wrappedValue = saveDictionery
    }
    
    func getUserDef()->[CitySearchModel] {
        var citysStorage = CityStorage()
        var cityDef = [CitySearchModel]()
        
        guard let saveDictionery = citysStorage.cityiesUserDefault.wrappedValue else { return cityDef }
        for item in saveDictionery {
            cityDef.append(CitySearchModel(cityName: item.value, countryName: "", cityKey: item.key))
        }
        return cityDef
    }
}
