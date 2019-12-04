//
//  WeatherModel.swift
//  Forecasts
//
//  Created by Z on 11/14/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

struct Weather {
    let currentCity: CityModel?
    let hoursWeather: [HourWeather]?
    let daysWeather: [DayWeather]?
}

struct HourWeather {
    let hour: String
    let icon: String
    let temp: String
    let iconPhrase: String
}

struct DayWeather {
    let day: String
    let icon: String
    let temp: String
    let sunRise: String
    let sunSet: String
    let iconPhrase: String
}

