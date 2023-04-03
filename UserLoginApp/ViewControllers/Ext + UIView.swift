//
//  Ext + UIView.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 04.04.2023.
//

import UIKit

// MARK: - Work with Background Gradient
extension UIView {
    func setGradient(with colors: [UIColor]) {
        let gradient = CAGradientLayer()
        var cgColors: [CGColor] = []
    
        for color in colors {
            cgColors.append(color.cgColor)
        }
        
        gradient.frame = bounds
        gradient.colors = cgColors
        layer.insertSublayer(gradient, at: 0)
    }
}
