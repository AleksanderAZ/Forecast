//
//  WeatherViewController.swift
//  Forecasts
//
//  Created Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import SafariServices

class WeatherViewController: UIViewController, WeatherViewProtocol {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let cellIdentifier = [ "CurrentTempCell", "TimeForecastCell", "DayForecastCell", "AdditionInfoCell"]
    
    @IBAction func listActionButton(_ sender: UIButton) {
        presenter?.showCityView()
    }
    
    @IBAction func linkActionButton(_ sender: UIButton) {
        presenter?.openLinkSafary()
       // presenter?.showLinkView()
    }
    
    @IBOutlet weak var weatherTable: UITableView!
    @IBOutlet weak var cityLabel: UILabel!
    
    var presenter: WeatherPresenterProtocol?

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewWillAppear(animated)
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
    
        weatherTable.delegate = self
        weatherTable.dataSource = self
        for item in cellIdentifier {
            weatherTable.register(UINib(nibName: item, bundle: nil), forCellReuseIdentifier: item)
        }
        //weatherTable.rowHeight = UITableView.automaticDimension
        //weatherTable.estimatedRowHeight = 200
        weatherTable.tableFooterView = UIView(frame: .zero)
        
        if presenter?.getCityName() == "" {
            presenter?.showCityView()
        }
        //update()
    }
    
    func update() {
        DispatchQueue.main.async {
            self.weatherTable.reloadData()
            self.weatherTable.separatorStyle = .none
            self.cityLabel.text = self.presenter?.getCityName()
            self.activityIndicator.stopAnimating()
        }
    }
}

extension WeatherViewController: WeatherDelegate {
    func getForecasts(city: CityModel?) {
        self.presenter?.getForecasts(city: city)
    }
}

extension WeatherViewController:  UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter?.countCell(section: section) ?? 0
        return count
    }
    
    func getIdentifier(section: Int)->String {
        return cellIdentifier[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = getIdentifier(section: indexPath.section)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let cell = cell as? AdditionInfoCell{
            let text = self.presenter?.getAddInfo() ?? ""
            cell.configCell(text: text)
        }
        else if let cell = cell as? DayForecastCell {
            let day = self.presenter?.getDay(index: indexPath.row) ?? ""
            let cloud = self.presenter?.getDayCloud(index: indexPath.row) ?? ""
            let tempr = self.presenter?.getDayTempr(index: indexPath.row) ?? ""
            cell.configCell(day: day, cloud: cloud, tempr: tempr)
        }
        else if let cell = cell as? TimeForecastCell {
            //cell.frame.size.height = 300
            cell.configCell(presenter: self.presenter)
        }
        else if let cell = cell as? CurrentTempCell {
            let tempr = self.presenter?.getCityTempr() ?? ""
            cell.configCell(tempr: tempr)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension WeatherViewController: SFSafariViewControllerDelegate {
    
}
