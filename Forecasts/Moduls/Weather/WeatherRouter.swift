//
//  WeatherRouter.swift
//  Forecasts
//
//  Created Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import SafariServices

class WeatherRouter: WeatherWireframeProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> WeatherViewController {
        let view = WeatherViewController(nibName: nil, bundle: nil)
        let interactor = WeatherInteractor()
        let router = WeatherRouter()
        let presenter = WeatherPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func showCityView(cityName: String) {
        if let viewCityController = CityRouter.createModule() as? CityViewController {
            if let viewWeatherController = self.viewController as? WeatherViewController {
                viewCityController.delegate = viewWeatherController
                self.viewController?.navigationController?.pushViewController(viewCityController, animated: true)
            }
        }
    }
    
    func showLinkView() {
        let view = WebViewRouter.createModule()
        self.viewController?.navigationController?.pushViewController(view, animated: true)
    }
    
    func openLinkSafary(link: String) {
        guard let url = URL(string: link) else { return }
        let controller = SFSafariViewController(url: url)
        controller.preferredBarTintColor = .darkGray
        controller.dismissButtonStyle = .close
        controller.configuration.barCollapsingEnabled = true
        guard let viewSafaryDelegat = self.viewController as? SFSafariViewControllerDelegate else { return }
        controller.delegate = viewSafaryDelegat
        self.viewController?.navigationController?.present(controller, animated: true, completion: nil)
    }
}
