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
   
    init(interface: WeatherViewProtocol, interactor: WeatherInteractorProtocol?, router: WeatherWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func showCityView() {
        let cityName = getCityName()
        router.showCityView(cityName: cityName)
    }
    
    func openLinkSafary() {
        guard let link = self.interactor?.getMobilLink() else {return }
        self.router.openLinkSafary(link: link)
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

    func refreshForecasts() {
        guard let currentCity = interactor?.getCurrentCity() else { return }
        self.interactor?.getForecasts(city: currentCity)
    }
    
    func update() {
        self.view?.update()
    }
    
    func getDay(index: Int)->String {
        guard let day = self.interactor?.getDay(index: index) else { return ""}
        return day.day
    }
    
    func getAddInfo()->String {
        guard let day = self.interactor?.getDay(index: indexAddInfoSelect) else { return ""}
        let sunRise = day.sunRise
        let sunSet = day.sunSet
        return "sunRise: " + sunRise + " - sunSet: " + sunSet
    }
    
    func getDayCloud(index: Int)->String {
        guard let day = self.interactor?.getDay(index: index) else { return ""}
        return day.iconPhrase
    }
    
    func getDayTempr(index: Int)->String {
        guard let day = self.interactor?.getDay(index: index) else { return ""}
        return day.tempr
    }
    
    func getDayIcon(index: Int)->String {
        guard let day = self.interactor?.getDay(index: index) else { return ""}
        return day.icon
    }
    
    func getHour(index: Int)->HourWeather? {
        return self.interactor?.getHour(index: index)
    }
    
    func getCityName()->String {
        
        if let currentCity = interactor?.getCurrentCity() {
            return currentCity.city.cityName
        }
        return ""
    }
    
    func getCityTempr()->String {
        guard let currentCity = interactor?.getCurrentCity() else { return ""}
        return currentCity.tempr
    }
    
    func countHour()->Int {
        return self.interactor?.getHourCount() ?? 0
    }
}
