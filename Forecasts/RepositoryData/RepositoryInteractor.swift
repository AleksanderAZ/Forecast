//
//  RepositoryInteractor.swift
//  Forecasts
//
//  Created by Z on 11/21/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

class RepositoryInteractor: RepositoryInteractorProtocol {
    
    private weak var repository: RepositoryData?
    
    func config(repository: RepositoryData) {
        self.repository = repository
    }
    
    func loadCityList(citySearchText: String) {
       
    }
    
    func loadForecastDayList(cityID: String){
      
    }
    
    func getForecastHourList(cityID: String){
        
    }
    
    func getForecastAddInfo(cityID: String){
       
    }
    
    
}
