//
//  registration.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class RegistrationScreen: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var registrationScreenTextLabel: UILabel!
    
    //MARK: ViewLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextFields()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.title = "Registration"
        self.view.backgroundColor = .systemGray3
    }
    
    private func setupTextFields() {
        self.emailTextField.placeholder = "@Email"
        self.passwordTextField.placeholder = "Password"
        self.confirmPasswordTextField.placeholder = "Confirm Password"
        self.passwordTextField.textContentType = .password
        self.confirmPasswordTextField.textContentType = .password
        self.emailTextField.textContentType = .emailAddress
        self.passwordTextField.isSecureTextEntry = true
        self.confirmPasswordTextField.isSecureTextEntry = true
    }
    
}
