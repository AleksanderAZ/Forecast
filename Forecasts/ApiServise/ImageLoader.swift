//
//  LoadImage.swift
//  Forecasts
//
//  Created by Z on 12/4/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation
import UIKit

class ImageLoader {
    
    static func load(for imageView: UIImageView, icon: String, completion: @escaping ()->()) {
        var url: String
        if icon.count == 1 {
            url = RequestsDataAPI.imadeURL + "0" + icon + "-s.png"
        }
        else {
            url = RequestsDataAPI.imadeURL + icon + "-s.png"
        }
        DispatchQueue.global().async {
            let url = url
            guard let imgURL = URL(string: url) else {completion(); return}
            guard let imgData = NSData(contentsOf: imgURL) else { completion(); return}
            DispatchQueue.main.async {
                guard let image = UIImage(data: imgData as Data) else { completion(); return }
                imageView.image = image
                completion()
            }
        }
    }
}
