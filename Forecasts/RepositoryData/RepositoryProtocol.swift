//
//  RepositoryProtocol.swift
//  Forecasts
//
//  Created by Z on 11/21/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation


protocol RepositoryDataProtocol {
    
    func getCitySearchList(citySearchText: String) -> [CityModel]?
    
    func getCityList() -> [CityModel]?
    func getLastCity() -> CityModel?
    func setLastCity(city: CityModel)
    func addCityToList(city: CityModel)
    func delCityFromList(city: CityModel)
    
    func getForecastDayList(city: CityModel) -> [DayWeather]?
    func getForecastHourList(city: CityModel) -> [HourWeather]?
    func getForecastAddInfo(city: CityModel) -> [AddInfo]?
    func getWeather(city: CityModel) -> [Weather]?
    
    func setUpdate(updatePresenter: (()->())?)
    func updateSearch(resultSearch: [CityAPIJSONElement]?) 
}

protocol RepositoryInteractorProtocol {
    func config(repository: RepositoryData)
    
    func loadCityList(citySearchText: String)
    func loadForecastDayList(cityID: String)
    func getForecastHourList(cityID: String)
    func getForecastAddInfo(cityID: String)
}
