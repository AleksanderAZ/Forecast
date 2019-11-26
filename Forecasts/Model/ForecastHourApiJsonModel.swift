//
//  ForecastHourApiJsonModel.swift
//  Forecasts
//
//  Created by Z on 11/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation


// MARK: - ForecastHourAPIJSONElement
struct ForecastHourAPIJSONElement: Codable {
    let dateTime: Date?
    let epochDateTime, weatherIcon: Int?
    let iconPhrase: IconPhrase?
    let hasPrecipitation, isDaylight: Bool?
    let temperature: Temperature?
    let precipitationProbability: Int?
    let mobileLink, link: String?
    
    enum CodingKeys: String, CodingKey {
        case dateTime = "DateTime"
        case epochDateTime = "EpochDateTime"
        case weatherIcon = "WeatherIcon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case isDaylight = "IsDaylight"
        case temperature = "Temperature"
        case precipitationProbability = "PrecipitationProbability"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

enum IconPhrase: String, Codable {
    case cloudy = "Cloudy"
    case intermittentClouds = "Intermittent clouds"
}

// MARK: - Temperature
struct Temperature: Codable {
    let value: Int?
    let unit: Unit?
    let unitType: Int?
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
}

typealias ForecastHourAPIJSON = [ForecastHourAPIJSONElement]

