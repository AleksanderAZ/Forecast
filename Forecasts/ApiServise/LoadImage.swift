//
//  LoadImage.swift
//  Forecasts
//
//  Created by Z on 12/4/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation
import UIKit

class LoadImage {
    
    var imageView: UIImageView
    var url: String
    
    init(imageView: UIImageView, icon: String) {
        self.imageView = imageView
        
        if icon.count == 1 {
            self.url = RequestsDataAPI.imadeURL + "0" + icon + "-s.png"
        }
        else {
            self.url = RequestsDataAPI.imadeURL + icon + "-s.png"
        }
    }
    
    func load() {
        DispatchQueue.global().async {
            let url = self.url
            guard let imgURL = URL(string: url) else {return}
            guard let imgData = NSData(contentsOf: imgURL) else { return}
            DispatchQueue.main.async {
                guard let image = UIImage(data: imgData as Data) else { return }
                self.imageView.image = image
            }
        }
    }
}
