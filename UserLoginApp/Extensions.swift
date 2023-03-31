//
//  Extensions.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 31.03.2023.
//

import UIKit

extension UIViewController {
    
    // MARK: - Alert
    func showOKAlert(withTitle title: String, andMessage message: String, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Cancel", style: .destructive, handler: handler)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showOKAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }

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
