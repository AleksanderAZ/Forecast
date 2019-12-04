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
    
    private func request(index: Int) {
        let citySearch = CitysData.shared.citys[index].city
        let pathURL = RequestsDataAPI.currentWeatherPath + citySearch.cityKey
        NetworkServiceAPI.shared.loadAPIRequest(pathURL: pathURL) { [weak self] (result: [CurrentlyAPIJSONModel]?, error) in
            guard let self = self else { return }
            guard let result = result else { print(error as Any); return }
            var cityTempr: String
            var cityLink: String
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
            CitysData.shared.citys[index].temp = cityTempr
            CitysData.shared.citys[index].link = cityLink
            self.updateTempr(index: index + 1)
        }
    }
    
    private func updateTempr(index: Int) {
        let quantity = CitysData.shared.citys.count

        if (index < quantity) {
            self.request(index: index)
        }
        else {
            guard let presenter = self.presenter else { return }
            presenter.update()
        }
    }
    
    func refreshTempr() {
        self.updateTempr(index: 0)
    }
    
    func addCity(citySearch: CitySearchModel?) {
        guard let citySearch = citySearch else { return }
        var isExist = false
        for city in CitysData.shared.citys {
            if (city.city.cityKey == citySearch.cityKey) {
                isExist = true
            }
        }
        if (isExist == false) {
            CitysData.shared.citys.insert(CityModel(city: citySearch, temp: "", link: ""), at: 0)
        }
        self.updateTempr(index: 0)
    }
    
    func deleteCity(index: Int) {
        CitysData.shared.citys.remove(at: index)
    }
}
