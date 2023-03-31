//
//  WelcomeViewController.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 31.03.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet private weak var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, " + userName + "!"
        
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.purple.cgColor,
            UIColor.systemPink.cgColor
        ]
        view.layer.insertSublayer(gradient, at: 0)
    }
}
