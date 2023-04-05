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
    @IBOutlet private var goButton: UIButton!
    
    // MARK: - Public Properties
    var welcomeText: String!
    var user: User!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: [#colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.7529411765, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1)])
        
        welcomeLabel.text = welcomeText
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let  tBarContr = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tBarContr.viewControllers else { return }
        
        for viewController in viewControllers {
            guard let navigationVC = viewController as? UINavigationController else { return }
            if let aboutMeVC = navigationVC.topViewController as? AboutMeViewController {
                aboutMeVC.user = user.owner
            } else if let contactsVC = navigationVC.topViewController as? ContactsViewController {
                contactsVC.user = user.owner
            } else if let gitHubVC = navigationVC.topViewController as? GitHubViewController {
                gitHubVC.user = user.owner
            }
        }
    }
        
    override func viewWillLayoutSubviews() {
        setupGoButton()
        animateGoButton()
    }
    
    // MARK: - Private Methods
    private func setupGoButton() {
        goButton.layer.cornerRadius = goButton.frame.height / 2
        goButton.layer.borderWidth = 3
        goButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func animateGoButton() {
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0.5921555071).cgColor
        colorAnimation.toValue = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 0.6979253908).cgColor
        colorAnimation.byValue = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
        colorAnimation.duration = 2
        colorAnimation.repeatCount = .infinity
        colorAnimation.autoreverses = true
        
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.fromValue = 0.5
        springAnimation.toValue = 1
        springAnimation.duration = 1
        springAnimation.damping = 10
        springAnimation.repeatCount = .infinity
        springAnimation.autoreverses = true
        
        goButton.layer.add(springAnimation, forKey: nil)
        goButton.layer.add(colorAnimation, forKey: nil)
    }
}
