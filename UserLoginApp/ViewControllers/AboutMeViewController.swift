//
//  AboutMeViewController.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 04.04.2023.
//

import UIKit

final class AboutMeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var myImage: UIImageView!
    
    @IBOutlet private var aboutMeLabel: UILabel!
    
    // MARK: - Public Properties
    var user: Owner!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: [#colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.7529411765, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1)])
        
        myImage.image = UIImage(named: user.info.photo[.first] ?? "")
        aboutMeLabel.text = user.info.mainInfo
    }
    
    @IBAction func exitButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        myImage.layer.cornerRadius = myImage.layer.frame.height / 2
    }
    
    // MARK: - IB Actions
    @IBAction private func segmentedControlMoved(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            aboutMeLabel.text = user.info.mainInfo
            myImage.image = UIImage(named: user.info.photo[.first] ?? "")
        case 1:
            aboutMeLabel.text = user.info.job
            myImage.image = UIImage(named: user.info.photo[.second] ?? "")
        case 2:
            aboutMeLabel.text = user.info.education
            myImage.image = UIImage(named: user.info.photo[.third] ?? "")
        default:
            aboutMeLabel.text = user.info.hobbies
            myImage.image = UIImage(named: user.info.photo[.fourth] ?? "")
        }
    }
}
