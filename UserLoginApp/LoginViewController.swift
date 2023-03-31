//
//  LoginViewController.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 31.03.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var userNameTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Private Properties
    private let userName = "User"
    private let password = "Pass"
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.systemYellow.cgColor,
            UIColor.systemGray3.cgColor,
            UIColor.white.cgColor,
            UIColor.systemGray3.cgColor,
            UIColor.systemYellow.cgColor
        ]
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.userName = userName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction private func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
        setupUI()
    }
    
    @IBAction private func loginButtonAction() {
        if userNameTF.text != userName && passwordTF.text != password {
            showOKAlert(withTitle: "Oops!", andMessage: "Wrong data!") { _ in
                self.passwordTF.text = ""
                self.setupUI()
            }
        }
    }
    
    @IBAction private func forgotNameOrPassAction(_ sender: UIButton) {
        if sender.tag == 0 {
            showOKAlert(withTitle: "👽", andMessage: "Your name: \(userName)")
        } else {
            showOKAlert(withTitle: "👽", andMessage: "Your password: \(password)")
        }
    }

    @IBAction private func textChanged() {
        setupUI()
    }
}

// MARK: - Extension - Button Setup
extension LoginViewController {
    
    private func setupUI() {
        let userName = userNameTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        if !userName.isEmpty && !password.isEmpty {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemOrange
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .systemGray2
        }
    }
}
