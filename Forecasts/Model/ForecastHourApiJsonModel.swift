//
//  ForecastHourApiJsonModel.swift
//  Forecasts
//
//  Created by Z on 11/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation


// MARK: - ForecastHourAPIJSONModel
struct ForecastHourAPIJSONModel: Codable {
    let dateTime: String?
    let epochDateTime, icon: Int?
    let iconPhrase: String?
    let hasPrecipitation: Bool?
    let precipitationType, precipitationIntensity: String?
    let isDaylight: Bool?
    let temperature: Temperature?
    let precipitationProbability: Int?
    let mobileLink, link: String?
    
    enum CodingKeys: String, CodingKey {
        case dateTime = "DateTime"
        case epochDateTime = "EpochDateTime"
        case icon = "WeatherIcon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case precipitationType = "PrecipitationType"
        case precipitationIntensity = "PrecipitationIntensity"
        case isDaylight = "IsDaylight"
        case temperature = "Temperature"
        case precipitationProbability = "PrecipitationProbability"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

// MARK: - Temperature
struct Temperature: Codable {
    let value: Double?
    let unit: String?
    let unitType: Int?
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
}
