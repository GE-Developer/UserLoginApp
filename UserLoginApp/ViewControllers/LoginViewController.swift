//
//  LoginViewController.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 31.03.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var loginTF: UITextField!
    @IBOutlet private var passTF: UITextField!
    @IBOutlet private var guestSwitch: UISwitch!
    
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var forgotNameButton: UIButton!
    @IBOutlet private var forgotPasswordButton: UIButton!
    
    // MARK: - Private Properties
    private let user = User.getData()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTF.delegate = self
        passTF.delegate = self
        
        setupButton()
        view.setGradient(with: [#colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.7529411765, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1)])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = user
        welcomeVC.welcomeText = sender as? String
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction private func unwind(for unwindSegue: UIStoryboardSegue) {
        if guestSwitch.isOn {
            guestSwitch.isOn.toggle()
        }
        clearUI()
        setupButton()
    }
    
    @IBAction private func loginButtonAction() {
        let isOwner = loginTF.text == user.owner.login && passTF.text == user.owner.password
        let isGuest = loginTF.text == user.guest.login && passTF.text == user.guest.password
        
        if isOwner {
            performSegue(withIdentifier: "showWelcomeVC", sender: user.owner.welcomeMessage)
        } else if isGuest {
            view.endEditing(true) // тк нужно скрыть клваиатуру перед алертом
            
            // Развернут алерт тут, так как он нужен один раз
            let alert = UIAlertController(
                title: "Attention",
                message: "Do you agree to the terms of confidentielity of personal data?",
                preferredStyle: .actionSheet)
            let okAction = UIAlertAction(title: "Agree", style: .default) { _ in
                self.performSegue(withIdentifier: "showWelcomeVC", sender: self.user.guest.welcomeMessage)
            }
            let denyAction = UIAlertAction(title: "Cancel", style: .destructive)
            alert.addAction(okAction)
            alert.addAction(denyAction)
            present(alert, animated: true)
        } else {
            showAlert(title: "Error", message: "Wrong data!", textField: passTF)
        }
    }
    
    @IBAction private func forgotNameOrPassAction(_ sender: UIButton) {
        sender.accessibilityIdentifier == "user"
        ? showAlert(title: "👽", message: "Owner's name: \(user.owner.login)")
        : showAlert(title: "👽", message: "Owner's password: \(user.owner.password)")
    }
    
    @IBAction private func guestSwitchMoved() {
        if guestSwitch.isOn {
            loginTF.text = user.guest.login
            passTF.text = user.guest.password
            
            loginTF.isEnabled = false
            loginTF.backgroundColor = .systemGray3
            
            passTF.isEnabled = false
            passTF.backgroundColor = .systemGray3
            
            forgotNameButton.isHidden = true
            forgotPasswordButton.isHidden = true
        } else {
            clearUI()
        }
        setupButton()
    }
        
    // MARK: - Private Methods
    private func setupButton() {
        let userName = loginTF.text ?? ""
        let password = passTF.text ?? ""
        
        if !userName.isEmpty && !password.isEmpty {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemOrange
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .systemGray2
        }
    }
    
    private func clearUI() {
        loginTF.text = nil
        passTF.text = nil
        
        loginTF.isEnabled = true
        loginTF.backgroundColor = .white
        
        passTF.isEnabled = true
        passTF.backgroundColor = .white
        
        forgotNameButton.isHidden = false
        forgotPasswordButton.isHidden = false
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Work with TextField
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        setupButton()
    }
}
