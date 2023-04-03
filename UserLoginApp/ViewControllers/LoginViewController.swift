//
//  LoginViewController.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 31.03.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var userNameTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    
    @IBOutlet private var loginButton: UIButton!
    
    // MARK: - Private Properties
    private let userName = "User"
    private let password = "Pass"
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
       
        userNameTF.text = userName
        passwordTF.text = password
        
        setupButton()
        view.setGradient(with: [#colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.7529411765, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1)])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userName
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction private func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
        setupButton()
    }
    
    @IBAction private func loginButtonAction() {
        guard userNameTF.text == userName, passwordTF.text == password else {
            showAlert(
                title: "Error",
                message: "Wrong data!",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction private func forgotNameOrPassAction(_ sender: UIButton) {
        sender.accessibilityIdentifier == "user"
        ? showAlert(title: "👽", message: "Your name: \(userName)")
        : showAlert(title: "👽", message: "Your password: \(password)")
    }
    
    // MARK: - Private Methods
    private func setupButton() {
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
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
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

