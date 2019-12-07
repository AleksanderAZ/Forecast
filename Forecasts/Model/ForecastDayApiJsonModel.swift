//
//  ForecastDayApiJsonModel.swift
//  Forecasts
//
//  Created by Z on 11/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

// MARK: - ForecastDayAPIJSONModel
struct ForecastDayAPIJSONModel: Codable {
    let headline: Headline?
    let dailyForecasts: [DailyForecast]?
    
    enum CodingKeys: String, CodingKey {
        case headline = "Headline"
        case dailyForecasts = "DailyForecasts"
    }
}

// MARK: - DailyForecast
struct DailyForecast: Codable {
    let date: String?
    let epochDate: Int?
    let sun: Sun?
    let moon: Moon?
    let temperature: RealFeelTemperature?
    let airAndPollen: [AirAndPollen]?
    let day, night: Day?
    let sources: [String]?
    let mobileLink, link: String?
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case epochDate = "EpochDate"
        case sun = "Sun"
        case moon = "Moon"
        case temperature = "Temperature"
        case airAndPollen = "AirAndPollen"
        case day = "Day"
        case night = "Night"
        case sources = "Sources"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

// MARK: - AirAndPollen
struct AirAndPollen: Codable {
    let name: String?
    let value: Int?
    let category: String?
    let categoryValue: Int?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
        case category = "Category"
        case categoryValue = "CategoryValue"
        case type = "Type"
    }
}

// MARK: - Day
struct Day: Codable {
    let icon: Int?
    let iconPhrase: String?
    let hasPrecipitation: Bool?
    let precipitationType, precipitationIntensity, shortPhrase, longPhrase: String?
    let precipitationProbability, thunderstormProbability, rainProbability, snowProbability: Int?
    let iceProbability: Int?
    let wind, windGust: Wind?
    let totalLiquid, rain, snow, ice: Ice?
    let hoursOfPrecipitation, hoursOfRain: Double?
    let hoursOfSnow, hoursOfIce, cloudCover: Int?
    
    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case precipitationType = "PrecipitationType"
        case precipitationIntensity = "PrecipitationIntensity"
        case shortPhrase = "ShortPhrase"
        case longPhrase = "LongPhrase"
        case precipitationProbability = "PrecipitationProbability"
        case thunderstormProbability = "ThunderstormProbability"
        case rainProbability = "RainProbability"
        case snowProbability = "SnowProbability"
        case iceProbability = "IceProbability"
        case wind = "Wind"
        case windGust = "WindGust"
        case totalLiquid = "TotalLiquid"
        case rain = "Rain"
        case snow = "Snow"
        case ice = "Ice"
        case hoursOfPrecipitation = "HoursOfPrecipitation"
        case hoursOfRain = "HoursOfRain"
        case hoursOfSnow = "HoursOfSnow"
        case hoursOfIce = "HoursOfIce"
        case cloudCover = "CloudCover"
    }
}

// MARK: - Ice
struct Ice: Codable {
    let value: Double?
    let unit: String?
    let unitType: Int?
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Ice?
    let direction: Direction?
    
    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
        case direction = "Direction"
    }
}

// MARK: - Direction
struct Direction: Codable {
    let degrees: Int?
    let localized, english: String?
    
    enum CodingKeys: String, CodingKey {
        case degrees = "Degrees"
        case localized = "Localized"
        case english = "English"
    }
}

// MARK: - DegreeDaySummary
struct DegreeDaySummary: Codable {
    let heating, cooling: Ice?
    
    enum CodingKeys: String, CodingKey {
        case heating = "Heating"
        case cooling = "Cooling"
    }
}

// MARK: - Moon
struct Moon: Codable {
    let rise: String?
    let epochRise: Int?
    let moonSet: String?
    let epochSet: Int?
    let phase: String?
    let age: Int?
    
    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case moonSet = "Set"
        case epochSet = "EpochSet"
        case phase = "Phase"
        case age = "Age"
    }
}

// MARK: - RealFeelTemperature
struct RealFeelTemperature: Codable {
    let minimum, maximum: Ice?
    
    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

// MARK: - Sun
struct Sun: Codable {
    let rise: String?
    let epochRise: Int?
    let sunSet: String?
    let epochSet: Int?
    
    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case sunSet = "Set"
        case epochSet = "EpochSet"
    }
}

// MARK: - Headline
struct Headline: Codable {
    let effectiveDate: String?
    let effectiveEpochDate, severity: Int?
    let text, category: String?
    let endDate: String?
    let endEpochDate: Int?
    let mobileLink, link: String?
    
    enum CodingKeys: String, CodingKey {
        case effectiveDate = "EffectiveDate"
        case effectiveEpochDate = "EffectiveEpochDate"
        case severity = "Severity"
        case text = "Text"
        case category = "Category"
        case endDate = "EndDate"
        case endEpochDate = "EndEpochDate"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}
