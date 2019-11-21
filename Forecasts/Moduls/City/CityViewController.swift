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

    let cellIdentifier = "CityCell"
	var presenter: CityPresenterProtocol?

    @IBOutlet weak var cityTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.navigationItem.leftBarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(clickRightButtonBar))
        
        cityTable.delegate = self
        cityTable.dataSource = self
        
        cityTable.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
       
        cityTable.rowHeight = UITableView.automaticDimension
        cityTable.tableFooterView = UIView(frame: .zero)
    }

    @objc func clickRightButtonBar() {
        presenter?.showSearchCityView()
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, handler) in
            print(indexPath.row)
        })
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return config
    }
}