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
    static let citysFavorite: Key = "citysFavorite"
}

protocol PropertyListValue {}
extension String: PropertyListValue {}
extension Data: PropertyListValue {}
extension Dictionary: PropertyListValue where Key == String, Value: PropertyListValue {}
extension Array: PropertyListValue where Element: PropertyListValue {}

//@propertyWrapper
struct CitysUserDefault<T: PropertyListValue> {
    let key: Key

    init(key: Key){
        self.key = key
    }
    
    var wrappedValue: T? {
        get { return UserDefaults.standard.value(forKey: key.rawValue) as? T }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}

struct CityStorage {
    var citysUserDefault = CitysUserDefault<[String: String]>(key: Key.citysFavorite)
}

class CitysData {
    
    func saveUserDef(save: [CityModel]) {
        var citysStorage = CityStorage()
        var saveDictionery = [String: String]()
        
        for item in save {
            let key = item.city.cityKey
            let name = item.city.cityName
            saveDictionery[key] = name
        }
        citysStorage.citysUserDefault.wrappedValue = saveDictionery
    }
    
    func getUserDef()->[CitySearchModel] {
        var citysStorage = CityStorage()
        var cityDef = [CitySearchModel]()
        
        guard let saveDictionery = citysStorage.citysUserDefault.wrappedValue else { return cityDef }
        for item in saveDictionery {
            cityDef.append(CitySearchModel(cityName: item.value, countryName: "", cityKey: item.key))
        }
        return cityDef
    }
}
