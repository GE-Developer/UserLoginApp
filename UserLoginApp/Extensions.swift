//
//  Extensions.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 31.03.2023.
//

import UIKit

extension UIViewController {
    
    // MARK: - Gradient
    func setGradient(with colors: [UIColor], for view: UIView, at layerIndex: UInt32) {
        
        let gradient = CAGradientLayer()
        var cgColors: [CGColor] = []
    
        for color in colors {
            cgColors.append(color.cgColor)
        }
        
        gradient.frame = view.bounds
        gradient.colors = cgColors
           
        view.layer.insertSublayer(gradient, at: layerIndex)
    }
}
