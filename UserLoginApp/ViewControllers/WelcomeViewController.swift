//
//  WelcomeViewController.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 31.03.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var welcomeLabel: UILabel!
    
    // MARK: - Public Properties
    var userName: String!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: [#colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.7529411765, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1)])
        
        welcomeLabel.text = "Welcome, " + userName + "!"
    }
}
