//
//  RepositoryData.swift
//  Forecasts
//
//  Created by Z on 11/18/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

class RepositoryData: RepositoryDataProtocol {
    
    private var interactor: RepositoryInteractor = RepositoryInteractor()
    
    func getCitySearchList(citySearchText: String) -> [CityModel]? {
            return nil
    }
    
    func getCityList() -> [CityModel]? {
       return nil
    }
    
    func getLastCity() -> CityModel? {
        return nil
    }
    
    func setLastCity(city: CityModel) {
        
    }
    
    func addCityToList(city: CityModel) {
        
    }
    
    func delCityFromList(city: CityModel) {
        
    }
    
    func getForecastDayList(city: CityModel) -> [DayWeather]? {
        return nil
    }
    
    func getForecastHourList(city: CityModel) -> [HourWeather]? {
        return nil
    }
    
    func getForecastAddInfo(city: CityModel) -> [AddInfo]? {
        return nil
    }
    
    func getWeather(city: CityModel) -> [Weather]? {
        return nil
    }
    
    func setUpdate(updatePresenter: (() -> ())?) {
        
    }
    
    func updateSearch(resultSearch: [CityAPIJSONElement]?) {
        print(resultSearch)
    }
    
}
