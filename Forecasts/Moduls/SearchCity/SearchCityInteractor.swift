//
//  SearchCityInteractor.swift
//  Forecasts
//
//  Created Z on 11/6/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SearchCityInteractor: SearchCityInteractorProtocol {

    weak var presenter: SearchCityPresenterProtocol?
    
    func searchDataEmpty() {
        guard let presenter = self.presenter else { return }
        presenter.updateSearch(resultSearch: nil)
    }
    
    func requestSearch(searchStr: String) {
        var resultSearch = [CitySearchModel]()
       
        // test start
       if CitysData.shared.citysSearch.count > 0 {
            presenter?.updateSearch(resultSearch: CitysData.shared.citysSearch)
            return
       }
        // test end
        NetworkServiceAPI.shared.loadAPIRequest(pathURL: RequestsDataAPI.townPath, searchText: searchStr) { [weak self] (result: [CityApiJsonModel]?, error) in
            guard let self = self else { return }
            guard let result = result else { print(error as Any); return }
            guard let presenter = self.presenter else { return }
            for item in  result {
                guard let cityName = item.localizedName else { continue }
                guard let countryName = item.country?.localizedName else { continue }
                guard let cityKey = item.key else { continue }
                let city = CitySearchModel(cityName: cityName, countryName: countryName, cityKey: cityKey)
                
                resultSearch.append(city)
            }
            presenter.updateSearch(resultSearch: resultSearch)
        }
    }
}
