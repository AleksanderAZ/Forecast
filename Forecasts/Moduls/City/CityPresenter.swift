//
//  CityPresenter.swift
//  Forecasts
//
//  Created Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class CityPresenter: CityPresenterProtocol {
   
    weak private var view: CityViewProtocol?
    var interactor: CityInteractorProtocol?
    private let router: CityWireframeProtocol

    init(interface: CityViewProtocol, interactor: CityInteractorProtocol?, router: CityWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func checkStart() {
        guard countIsEmpty() else {  self.update(); return }
        interactor?.loadCitys()
    }
    
    func countIsEmpty()->Bool {
        return countCell() == 0
    }
    
    func countCell()->Int {
        return interactor?.countCity() ?? 0
    }
    
    func showSearchCityView() {
        router.showSearchCityView()
    }
    
    func closeView(index: Int) {
        interactor?.saveCitys()
        router.closeView(city: interactor?.getCity(index: index))
    }
    
    func addCity(citySearch: CitySearchModel?) {
        self.interactor?.addCity(citySearch: citySearch)
    }
    
    func refreshTempr() {
        self.interactor?.refreshTempr()
    }
    
    func getNameCity(index: Int)->String {
        let city = interactor?.getCity(index: index)
        return city?.city.cityName ?? ""
    }
    
    func getTemprCity(index: Int)->String {
        let city = interactor?.getCity(index: index)
        return city?.tempr ?? ""
    }
    
    func deleteCity(index: Int) {
        self.interactor?.deleteCity(index: index)
        self.view?.update()
    }
    
    func update() {
         self.view?.update()
    }
}
