//
//  SearchCityProtocols.swift
//  Forecasts
//
//  Created Z on 11/6/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol SearchCityWireframeProtocol: class {
    func closeView(citySearch: CitySearchModel?)
}
//MARK: Presenter -
protocol SearchCityPresenterProtocol: class {
    func countCell()->Int
    func updateSearch(resultSearch: [CitySearchModel]?)
    func searchData(searchStr: String?)
    func getNameCity(index: Int)->String
    func closeView(citySearch: CitySearchModel?)
    func getCity(index: Int)->CitySearchModel?
    func searchDataEmpty()
}

//MARK: Interactor -
protocol SearchCityInteractorProtocol: class {
    var presenter: SearchCityPresenterProtocol?  { get set }
    
    func searchDataEmpty()
    func requestSearch(searchStr: String)
    
}

//MARK: View -
protocol SearchCityViewProtocol: class {
  var presenter: SearchCityPresenterProtocol?  { get set }
    
  func update()
}
