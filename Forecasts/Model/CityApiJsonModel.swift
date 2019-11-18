//
//  CityApiJsonModel.swift
//  Forecasts
//
//  Created by Z on 11/16/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

// MARK: - CityAPIJSONElement
struct CityAPIJSONElement: Codable {
    let version: Int?
    let key, type: String?
    let rank: Int?
    let localizedName: String?
    let country: AdministrativeArea?
    let administrativeArea: AdministrativeArea?
    
    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case key = "Key"
        case type = "Type"
        case rank = "Rank"
        case localizedName = "LocalizedName"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
    }
}

// MARK: - AdministrativeArea
struct AdministrativeArea: Codable {
    let id, localizedName: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case localizedName = "LocalizedName"
    }
}

typealias CityAPIJSON = [CityAPIJSONElement]
