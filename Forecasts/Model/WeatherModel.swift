//
//  WeatherModel.swift
//  Forecasts
//
//  Created by Z on 11/14/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: String
    let hoursWeather: [HourWeather]
    let daysWeather: [DayWeather]
    let addInfo: AddInfo
}

struct HourWeather {
    let hour: String
    let icon: String
    let temp: String
}

struct DayWeather {
    let day: String
    let icon: String
    let temp: String
}

struct AddInfo {
    let startInfo: String
}
