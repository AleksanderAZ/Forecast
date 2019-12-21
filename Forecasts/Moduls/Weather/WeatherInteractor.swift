//
//  WeatherInteractor.swift
//  Forecasts
//
//  Created Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class WeatherInteractor: WeatherInteractorProtocol {

    weak var presenter: WeatherPresenterProtocol?
    
    var dayWeather = [DayWeather]()
    var hourWeather = [HourWeather]()
    var currentCity: CityModel?
    
    func getDay(index: Int)->DayWeather? {
        if index < getDayCount() {
            return dayWeather[index]
        }
        else {
            return nil
        }
    }
    func getHour(index: Int)->HourWeather? {
        if index < getHourCount() {
            return hourWeather[index]
        }
        else {
            return nil
        }
    }
    
    func getDayCount()->Int {
        return dayWeather.count
    }
    
    func getCurrentCity()->CityModel? {
        return self.currentCity
    }
    
    func getMobilLink()->String? {
        return self.currentCity?.link
    }
    
    private func update() {
        guard let presenter = self.presenter else { return }
        guard let _ = self.currentCity else { return }
        presenter.update()
    }
    
    func getForecasts(city: CityModel?) {
        guard let cityKey = city?.city.cityKey else {return}
        self.currentCity = city
        self.requestDayWeather(cityKey: cityKey)
    }
    
    private func requestDayWeather(cityKey: String) {
        let pathURL = RequestsDataAPI.forecastDayPath + cityKey
        NetworkServiceAPI.shared.loadAPIRequest(pathURL: pathURL) { [weak self] (result: ForecastDayAPIJSONModel?, error) in
            guard let self = self else { return }
            guard let result = result else { print(String(describing: error)); return }
            self.setDayWeather(result: result)
            self.requestHourWeather(cityKey: cityKey)
        }
    }
    
    private func requestHourWeather(cityKey: String) {
        let pathURL = RequestsDataAPI.forecastHoursPath + cityKey
        NetworkServiceAPI.shared.loadAPIRequest(pathURL: pathURL) { [weak self] (result: [ForecastHourAPIJSONModel]?, error) in
            guard let self = self else { return }
            guard let result = result else { print(String(describing: error)); return }
            self.setHourWeather(result: result)
            self.update()
        }
    }
    
    private func setDayWeather(result: ForecastDayAPIJSONModel?) {
        var  dayWeather = [DayWeather]()
        guard let dailyForecasts = result?.dailyForecasts else { return}
        for item in dailyForecasts {
            guard let dayIso = item.date else {return}
            guard let iconPhrase = item.day?.iconPhrase else {return}
            guard let icon = item.day?.icon else {return}
            guard let tempMax = item.temperature?.maximum?.value else {return}
            guard let tempMin = item.temperature?.minimum?.value else {return}
            let tempr = String(format: "%.1f",(tempMin+tempMax)/2)
            guard let sunRise = item.sun?.rise else {return}
            guard let sunSet = item.sun?.sunSet else {return}
            let sunRiseTime = getFormatTime(strDate: sunRise)
            let sunSetTime = getFormatTime(strDate: sunSet)
            let day = getFormatDate(strDate: dayIso)
            let oneDay = DayWeather(day: day, icon: "\(icon)", tempr: tempr, sunRise: sunRiseTime, sunSet: sunSetTime, iconPhrase: iconPhrase)
            dayWeather.append(oneDay)
        }
        self.dayWeather = dayWeather
    }
    
    private func setHourWeather(result: [ForecastHourAPIJSONModel]?) {
        var  hourWeather = [HourWeather]()
        guard let forecastHour = result else { return}
        for item in forecastHour {
            guard let hourIso = item.dateTime else {return}
            guard let icon = item.icon else { return}
            guard let iconPhrase = item.iconPhrase else { return}
            guard let temprIso = item.temperature?.value else {return}
            let hour = getFormatHour(strDate: hourIso)
            let tempr = String(format: "%.1f",temprIso)
            let oneHour =  HourWeather(hour: hour, icon: "\(icon)", tempr: tempr, iconPhrase: iconPhrase)
            hourWeather.append(oneHour)
        }
        self.hourWeather = hourWeather
    }
    
    func getHourCount()->Int {
        return hourWeather.count
    }
    
    private func getDateFromString(strDate: String)->Date? {
        let str = String(strDate.prefix(19))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let formatedDate = dateFormatter.date(from: str) else {return nil}
        return formatedDate
    }
    
    private func getStrFromData(date: Date, format: String)->String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = format
        let time = dateFormatter.string(from: date)
        return time
    }
    
    func getFormatTime(strDate: String)->String {
        guard let date = getDateFromString(strDate: strDate) else { return ""}
        return getStrFromData(date: date, format: "dd MM yyyy HH:mm")
    }
    
    func getFormatDate(strDate: String)->String {
        guard let date = getDateFromString(strDate: strDate) else { return ""}
        return getStrFromData(date: date, format: "dd MM yyyy")
    }
    
    func getFormatHour(strDate: String)->String {
        guard let date = getDateFromString(strDate: strDate) else { return ""}
        return getStrFromData(date: date, format: "HH:mm")
    }
    
    func getImage(index: Int)->Data? {
        let url = RequestsDataAPI.imadeURL + String(format: "%02d-s.png", index)
        guard let imgURL = URL(string: url) else {return nil}
        guard let imgData = NSData(contentsOf: imgURL) else { return nil}
        return imgData as Data
    }
}
