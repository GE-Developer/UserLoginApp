//
//  GitHubViewController.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 05.04.2023.
//

import UIKit

class GitHubViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    
    
    // MARK: - Public Properties
    var user: Owner!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: [#colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.7529411765, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1)])
    }
    
    // MARK: - IB Actions
    @IBAction func gitHubButtonPressed() {
        guard let url = URL(string: user.info.contact.gitHub) else { return }
            UIApplication.shared.open(url)
    }
}
