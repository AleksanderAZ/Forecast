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

    
    func countCell()->Int {
        var count: Int
        
        count = 12
        
        return count
    }
    
    func showSearchCityView() {
        router.showSearchCityView()
    }
    
    func closeView() {
        router.closeView()
    }
}
