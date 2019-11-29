//
//  CityApiJsonModel.swift
//  Forecasts
//
//  Created by Z on 11/16/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

// MARK: - CityAPIJSONElement
struct CityApiJsonModel: Codable {
    let key: String?
    let localizedName: String?
    let country: AdministrativeArea?
    let administrativeArea: AdministrativeArea?
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case localizedName = "LocalizedName"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
    }
}

// MARK: - AdministrativeArea
struct AdministrativeArea: Codable {
    let id: String?
    let localizedName: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case localizedName = "LocalizedName"
    }
}
