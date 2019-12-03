//
//  Extention.swift
//  Forecasts
//
//  Created by Z on 11/29/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func getCornerRadius(_ view: UIView) {
        
        var radius: CGFloat
        let w = view.frame.width
        let h = view.frame.height
        if w > h {
            radius = h * 0.2
        } else {
            radius = w * 0.2
        }
        if radius > 20 {
            radius = 20
        }
        view.layer.cornerRadius = radius
        view.backgroundColor = .clear
    }
    func cornerRadiusAll() {
        guard let subView = self.view else {return}
        for subView in subView.subviews {
            for subView in subView.subviews {
                for subView in subView.subviews {
                    for subView in subView.subviews {
                        for subView in subView.subviews {
                            for subView in subView.subviews {
                                for subView in subView.subviews {
                                    getCornerRadius(subView)
                                }
                                getCornerRadius(subView)
                            }
                        getCornerRadius(subView)
                        }
                    getCornerRadius(subView)
                    }
                getCornerRadius(subView)
                }
            getCornerRadius(subView)
            }
        getCornerRadius(subView)
        }
    getCornerRadius(subView)
    }
}


