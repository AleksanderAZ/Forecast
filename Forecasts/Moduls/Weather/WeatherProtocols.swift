//
//  WeatherProtocols.swift
//  Forecasts
//
//  Created Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol WeatherWireframeProtocol: class {
    func showCityView(cityName: String)
    func showLinkView()
    func openLinkSafary(link: String)
}
//MARK: Presenter -
protocol WeatherPresenterProtocol: class {
    func showCityView()
    func showLinkView()
    func openLinkSafary()
    func countCell(section: Int)->Int
    func getForecasts(city: CityModel?)
    func refreshForecasts()
    func update()
    func getCityName()->String
    func getCityTempr()->String
    func countHour()->Int
    func getHour(index: Int)->HourWeather?
    func getDay(index: Int)->String
    func getDayCloud(index: Int)->String
    func getDayTempr(index: Int)->String
    func getAddInfo()->String
    func getDayIcon(index: Int)->String
}

//MARK: Interactor -
protocol WeatherInteractorProtocol: class {
    var presenter: WeatherPresenterProtocol?  { get set }
    func getDayCount()->Int
    func getHourCount()->Int
    func getForecasts(city: CityModel?)
    func getDay(index: Int)->DayWeather?
    func getHour(index: Int)->HourWeather?
    func getCurrentCity()->CityModel?
    func getMobilLink()->String?
    func getImage(index: Int)->Data?
}

//MARK: View -
protocol WeatherViewProtocol: class {
    func getForecasts(city: CityModel?)
    var presenter: WeatherPresenterProtocol?  { get set }
    func update()
}

protocol WeatherDelegate: class {
    func getForecasts(city: CityModel?)
}

protocol  AdditionInfoCellProtocol: class {
     func getAddInfo(index: Int)->String 
}
