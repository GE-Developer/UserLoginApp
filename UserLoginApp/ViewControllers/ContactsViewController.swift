//
//  ContactsViewController.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 04.04.2023.
//

import UIKit
import MapKit
import Contacts

final class ContactsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var nicknameLabel: UILabel!
    @IBOutlet private var telNumberLabel: UILabel!
    @IBOutlet private var telegramLabel: UILabel!
    @IBOutlet private var placeLabel: UILabel!
    
    @IBOutlet private var mapView: MKMapView!
    
    @IBOutlet private var saveContactButton: UIBarButtonItem!
    
    // MARK: - Public Properties
    var user: Owner!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(with: [#colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.7529411765, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.5137254902, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.4780735057, green: 0.4511794981, blue: 0.5, alpha: 1)])
        
        setupMap(
            user.info.contact.location.latitude,
            user.info.contact.location.longitude
        )
        
        nicknameLabel.text = user.nickName
        telNumberLabel.text = user.info.contact.tel
        telegramLabel.text = user.info.contact.telegram
        placeLabel.text = user.info.contact.fullAdress
    }
    
    // MARK: - IB Actions
    @IBAction private func saveContactButton(_ sender: UIBarButtonItem) {
        addContact()
    }
    
    // MARK: - Private Methods
    private func setupMap(_ latitude: Double, _ longitude: Double) {
        mapView.layer.cornerRadius = 20
        mapView.layer.opacity = 0.5
        
        mapView.setRegion(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                ),  latitudinalMeters: 4000.0,
                longitudinalMeters: 4000.0),
            animated: true)
    }
    
    private func addContact() {
        let contact = CNMutableContact()
        
        let image = UIImage(named: user.info.photo[.first] ?? "")
        contact.imageData = image?.jpegData(compressionQuality: 1.0)
        
        contact.givenName = user.info.name
        contact.familyName = user.info.surname
        
        contact.phoneNumbers = [
            CNLabeledValue(
                label: CNLabelPhoneNumberiPhone,
                value: CNPhoneNumber(stringValue: user.info.contact.tel)
            )
        ]
        
        let homeAddress = CNMutablePostalAddress()
        homeAddress.city = user.info.contact.city
        homeAddress.state = user.info.contact.country
        contact.postalAddresses = [CNLabeledValue(label: CNLabelHome, value: homeAddress)]
        
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier: nil)
        
        do {
            try store.execute(saveRequest)
            showAlert(
                title: "Successfully",
                message: "Contact \(user.info.name) added"
            )
            saveContactButton.isEnabled = false
        } catch {
            print("Saving contact failed, error: \(error)")
        }
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
