//
//  CurrentlyApiJsonModel.swift
//  Forecasts
//
//  Created by Z on 11/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation


// MARK: - CurrentlyAPIJSONElement
struct CurrentlyAPIJSONElement: Codable {
    let localObservationDateTime: Date?
    let epochTime: Int?
    let weatherText: String?
    let weatherIcon: Int?
    let hasPrecipitation: Bool?
    let precipitationType: JSONNull?
    let isDayTime: Bool?
    let temperature, realFeelTemperature, realFeelTemperatureShade: ApparentTemperature?
    let relativeHumidity: Int?
    let dewPoint: ApparentTemperature?
    let wind: Wind?
    let windGust: WindGust?
    let uvIndex: Int?
    let uvIndexText: String?
    let visibility: ApparentTemperature?
    let obstructionsToVisibility: String?
    let cloudCover: Int?
    let ceiling, pressure: ApparentTemperature?
    let pressureTendency: PressureTendency?
    let past24HourTemperatureDeparture, apparentTemperature, windChillTemperature, wetBulbTemperature: ApparentTemperature?
    let precip1Hr: ApparentTemperature?
    let precipitationSummary: [String: ApparentTemperature]?
    let temperatureSummary: TemperatureSummary?
    let mobileLink, link: String?
    
    enum CodingKeys: String, CodingKey {
        case localObservationDateTime = "LocalObservationDateTime"
        case epochTime = "EpochTime"
        case weatherText = "WeatherText"
        case weatherIcon = "WeatherIcon"
        case hasPrecipitation = "HasPrecipitation"
        case precipitationType = "PrecipitationType"
        case isDayTime = "IsDayTime"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case realFeelTemperatureShade = "RealFeelTemperatureShade"
        case relativeHumidity = "RelativeHumidity"
        case dewPoint = "DewPoint"
        case wind = "Wind"
        case windGust = "WindGust"
        case uvIndex = "UVIndex"
        case uvIndexText = "UVIndexText"
        case visibility = "Visibility"
        case obstructionsToVisibility = "ObstructionsToVisibility"
        case cloudCover = "CloudCover"
        case ceiling = "Ceiling"
        case pressure = "Pressure"
        case pressureTendency = "PressureTendency"
        case past24HourTemperatureDeparture = "Past24HourTemperatureDeparture"
        case apparentTemperature = "ApparentTemperature"
        case windChillTemperature = "WindChillTemperature"
        case wetBulbTemperature = "WetBulbTemperature"
        case precip1Hr = "Precip1hr"
        case precipitationSummary = "PrecipitationSummary"
        case temperatureSummary = "TemperatureSummary"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

// MARK: - ApparentTemperature
struct ApparentTemperature: Codable {
    let metric, imperial: Imperial?
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
        case imperial = "Imperial"
    }
}

// MARK: - Imperial
struct Imperial: Codable {
    let value: Double?
    let unit: String?
    let unitType: Int?
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
}

// MARK: - PressureTendency
struct PressureTendency: Codable {
    let localizedText, code: String?
    
    enum CodingKeys: String, CodingKey {
        case localizedText = "LocalizedText"
        case code = "Code"
    }
}

// MARK: - TemperatureSummary
struct TemperatureSummary: Codable {
    let past6HourRange, past12HourRange, past24HourRange: PastHourRange?
    
    enum CodingKeys: String, CodingKey {
        case past6HourRange = "Past6HourRange"
        case past12HourRange = "Past12HourRange"
        case past24HourRange = "Past24HourRange"
    }
}

// MARK: - PastHourRange
struct PastHourRange: Codable {
    let minimum, maximum: ApparentTemperature?
    
    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
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

// MARK: - WindGust
struct WindGust: Codable {
    let speed: ApparentTemperature?
    
    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
    }
}

typealias CurrentlyAPIJSON = [CurrentlyAPIJSONElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

