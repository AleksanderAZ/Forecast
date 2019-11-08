//
//  SearchCityRouter.swift
//  Forecasts
//
//  Created Z on 11/6/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SearchCityRouter: SearchCityWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = SearchCityViewController(nibName: nil, bundle: nil)
        let interactor = SearchCityInteractor()
        let router = SearchCityRouter()
        let presenter = SearchCityPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
