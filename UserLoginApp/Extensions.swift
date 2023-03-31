//
//  Extensions.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 31.03.2023.
//

import UIKit

extension UIViewController {
    
    func showOKAlert(withTitle title: String, andMessage message: String, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showOKAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

