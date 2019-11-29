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
        view.backgroundColor = .clear
        var radius: CGFloat
        let w = view.frame.width
        let h = view.frame.height
        if w > h {
            radius = h * 0.2
        } else {
            radius = w * 0.2
        }
        if radius > 50 {
            radius = 50
        }
        view.layer.cornerRadius = radius
    }
    func cornerRadiusAll() {
        
        guard let subView = self.view else {return}
        getCornerRadius(subView)
        for subView in subView.subviews {
            getCornerRadius(subView)
            for subView in subView.subviews {
                getCornerRadius(subView)
                for subView in subView.subviews {
                    getCornerRadius(subView)
                    for subView in subView.subviews {
                        getCornerRadius(subView)
                        for subView in subView.subviews {
                            getCornerRadius(subView)
                            for subView in subView.subviews {
                                getCornerRadius(subView)
                                for subView in subView.subviews {
                                    getCornerRadius(subView)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


