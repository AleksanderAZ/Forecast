//
//  CityInteractor.swift
//  Forecasts
//
//  Created Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class CityInteractor: CityInteractorProtocol {

    weak var presenter: CityPresenterProtocol?
    var cityiesData = CitiesData()
    var cities = [CityModel]()
    
    private func request(index: Int) {
        guard index < cities.count else { return }
        let citySearch = cities[index].city
        let pathURL = RequestsDataAPI.currentWeatherPath + citySearch.cityKey
        NetworkServiceAPI.shared.loadAPIRequest(pathURL: pathURL) { [weak self] (result: [CurrentlyAPIJSONModel]?, error) in
            guard let self = self else { return }
            guard let result = result else { print(error as Any); return }
            var cityTempr: String
            var cityLink: String
            var cityIcon: String
            if let tempr = result.first?.temperature?.metric?.value {
                 cityTempr = "\(tempr)"
            }
            else {
                cityTempr = "?"
            }
            if let link = result.first?.mobileLink {
                cityLink = link
            }
            else {
                cityLink = RequestsDataAPI.webURL
            }
            if let icon = result.first?.weatherIcon {
                cityIcon = "\(icon)"
            }
            else {
                cityIcon = ""
            }
            self.cities[index].tempr = cityTempr
            self.cities[index].link = cityLink
            self.cities[index].icon = cityIcon
            if index == self.cities.count - 1 {
                self.presenter?.update()
            }
        }
    }
    private func updateTempr(index: Int) {
        let quantity = cities.count

        if (index < quantity) {
            self.request(index: index)
            self.updateTempr(index: index + 1)
        }
    }
    
    func refreshTempr() {
        self.updateTempr(index: 0)
    }
    
    func addCity(citySearch: CitySearchModel?) {
        guard let citySearch = citySearch else { return }
        var isExist = false
        for city in self.cities {
            if (city.city.cityKey == citySearch.cityKey) {
                isExist = true
                break
            }
        }
        if (isExist == false) {
            self.cities.append(CityModel(city: citySearch))
            self.request(index: self.cities.count - 1)
        }
    }
    
    func deleteCity(index: Int) {
        self.cities.remove(at: index)
    }
    
    func loadCities() {
        let cityDef = cityiesData.getUserDef()
        if cityDef.count > 0 {
            for item in cityDef {
                self.addCity(citySearch: item)
            }
        }
        else {
            presenter?.showSearchCityView()
        }
    }
    
    func saveCities() {
        cityiesData.saveUserDef(save: cities)
    }
    
    func countCity()->Int {
        return cities.count
    }
    
    func getCity(index: Int)->CityModel? {
        guard  index < cities.count else { return nil }
        return cities[index]
    }
}
