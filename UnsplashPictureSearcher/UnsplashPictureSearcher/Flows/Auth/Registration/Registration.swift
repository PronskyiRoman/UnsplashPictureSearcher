//
//  registration.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class RegistrationScreen: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var registrationScreenTextLabel: UILabel!
    @IBOutlet private weak var errorEmailUiLabel: UILabel!
    @IBOutlet private weak var errorPasswordUiLabel: UILabel!
    @IBOutlet private weak var errorConfirmtPasswordUiLabel: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    
    //MARK: Services
    
    private let setupUIButtonManager = SetupUIButtonsManager()
    private let navigationManager = NavigationManager()
    private let setupTextFieldsManager = SetupTextFieldsManager()
    private let validationManager = ValidationManager()

    
    //MARK: ViewLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextFields()
        setupButtons()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.title = "Registration"
        self.view.backgroundColor = .systemGray3
        signUpButton.isEnabled = false
        errorEmailUiLabel.isHidden = true
        errorPasswordUiLabel.isHidden = true
        errorConfirmtPasswordUiLabel.isHidden = true
    }
    
    private func setupTextFields() {
        setupTextFieldsManager.setup(with: emailTextField, placeholder: "@Email", textContentType: .emailAddress)
        setupTextFieldsManager.setup(with: passwordTextField, placeholder: "Password", textContentType: .password, isSecureTextEntry: true)
        setupTextFieldsManager.setup(with: confirmPasswordTextField, placeholder: "Confirm Password", textContentType: .password, isSecureTextEntry: true)
    }
    
    private func setupButtons() {
        setupUIButtonManager.setupButton(with: signUpButton, color: .blue, title: "Sign Up", tintTextColor: .white)
    }
    
    //MARK: Functions
    
    private func validate() {
        let resultOfValidationEmail = validationManager.validateEmail(emailTextField: self.emailTextField,
                                                                      emailErrorLabel: self.errorEmailUiLabel)
        let resultOfValidationPassword = validationManager.validatePassword(passwordTextField: self.passwordTextField,
                                                                            confirmPasswordTextField: self.confirmPasswordTextField,
                                                                            errorPasswordLabel: self.errorPasswordUiLabel,
                                                                            confirmPasswordErrorLabel: self.errorConfirmtPasswordUiLabel)
        if resultOfValidationEmail && resultOfValidationPassword {
            signUpButton.isEnabled = true
        } else {
            signUpButton.isEnabled = false
        }
    }
    
    //MARK: Actions
    
    @IBAction private func signUpButtonTapped() {
        self.navigationManager.showController(StoryboardsNamesKeys.MainTabBarController.rawValue,
                                              ViewControllersIdentifiersKeys.MainTabBarController.rawValue,
                                              self,
                                              navigationBarIsHidden: true)
    }
    
    @IBAction private func validateTextFields() {
        validate()
    }
}
