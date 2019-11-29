//
//  WeatherPresenter.swift
//  Forecasts
//
//  Created Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class WeatherPresenter: WeatherPresenterProtocol {
    
    weak private var view: WeatherViewProtocol?
    var interactor: WeatherInteractorProtocol?
    private let router: WeatherWireframeProtocol
    
    var indexAddInfoSelect: Int = 0
    func getIndexAddInfoSelect()->Int {
        return indexAddInfoSelect
    }
    init(interface: WeatherViewProtocol, interactor: WeatherInteractorProtocol?, router: WeatherWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func showCityView() {
        router.showCityView()
    }
    func showLinkView() {
        let cityName = "CurrentCity"
        router.showLinkView(cityName: cityName)
    }
    
    func openLinkSafary() {
        self.router.openLinkSafary(link: RequestsDataAPI.webURL)
    }
    
    func countCell(section: Int)->Int {
        var count: Int
        
        if (section == 2) {
            count = self.interactor?.getDayCount() ?? 0
        }
        else {
            count = 1
        }
        return count
    }
    
    func getForecasts(city: CityModel?) {
        self.interactor?.getForecasts(city: city)
    }

    func update() {
        self.view?.update()
    }
    
    private func getDay(index: Int)->DayWeather? {
        return self.interactor?.getDay(index: index)
    }
    
    func getHour(index: Int)->HourWeather? {
        return self.interactor?.getHour(index: index)
    }
    func getCityName()->String {
        guard let currentCity = interactor?.getCurrentCity() else { return ""}
        return currentCity.city.cityName
    }
    
    func getCityTempr()->String {
        guard let currentCity = interactor?.getCurrentCity() else { return ""}
        return currentCity.temp
    }
    
    func countHour()->Int {
        return self.interactor?.getHourCount() ?? 0
    }
}

extension WeatherPresenter: AdditionInfoCellProtocol {
    func getAddInfo(index: Int)->String {
        let dayInfo = getDay(index: index)
        let sunRise = dayInfo?.sunRise ?? ""
        let sunSet = dayInfo?.sunSet ?? ""
        return "sunRise: " + sunRise + " - sunSet: " + sunSet
    }
}
