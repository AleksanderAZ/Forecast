//
//  CityViewController.swift
//  Forecasts
//
//  Created Z on 11/5/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class CityViewController: UIViewController, CityViewProtocol {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let cellIdentifier = "CityCell"
	var presenter: CityPresenterProtocol?
    weak var delegate: WeatherDelegate?
    
    @IBOutlet weak var cityTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.cornerRadiusAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(clickRightButtonBar))
        
        cityTable.delegate = self
        cityTable.dataSource = self
        
        cityTable.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
       
        cityTable.rowHeight = UITableView.automaticDimension
        cityTable.tableFooterView = UIView(frame: .zero)
        
        guard let presenter = self.presenter else {return}
        if presenter.countCell() < 1 {
            presenter.showSearchCityView()
        }
    }

    @objc func clickRightButtonBar() {
        presenter?.showSearchCityView()
    }
    
    func update() {
        DispatchQueue.main.async {
            self.cityTable.reloadData()
            self.indicator.stopAnimating()
        }
    }
}

extension CityViewController: CityDelegate {
    func getCity(citySearch: CitySearchModel?) {
        self.presenter?.addCity(citySearch: citySearch)
    }
}

extension CityViewController:  UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter?.countCell() ?? 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let cell = cell as? CityCell {
            cell.nameCity.text = self.presenter?.getNameCity(index: indexPath.row)
            cell.tempr.text = self.presenter?.getTemprCity(index: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //guard let city = presenter?.getCity(index: indexPath.row) else { return }
        //presenter?.closeView(citySearch: city)
        print(indexPath.row)
        
        presenter?.closeView(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, handler) in
            self.presenter?.deleteCity(index: indexPath.row)
        })
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
}
