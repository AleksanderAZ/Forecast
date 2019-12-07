//
//  ModelApiServise.swift
//  Forecasts
//
//  Created by Z on 11/14/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

struct RequestsDataAPI {
    static let imadeURL = "https://developer.accuweather.com/sites/default/files/"
    static let webURL = "https://www.accuweather.com"
    static let methodGet = "GET"
    static let baseURL = "https://dataservice.accuweather.com/"
    static let townPath = "locations/v1/cities/autocomplete"
    static let forecastHoursPath = "forecasts/v1/hourly/12hour/"
    static let forecastDayPath = "forecasts/v1/daily/5day/"
    static let currentWeatherPath = "currentconditions/v1/"
    static let parametersApiKey: [String: String] = ["apikey": "sqHA6GXR3N3QAQ6kGGbMEpogluATHOgV", "details": "true", "metric": "true"]
    static let searchKey = "q"
}

enum ErrorInfo {
    case dataIsNil
    case urlIsNil
    case componentsUrlIsNil
    
    var string: String {
        switch self {
        case .dataIsNil    : return "Data is lost, please try again"
        case .urlIsNil    : return "Wrong URL"
        case .componentsUrlIsNil   : return "Wrong ComponentsUrl"
        }
    }
}
