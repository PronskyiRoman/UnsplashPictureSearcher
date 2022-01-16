//
//  ForgotPassword.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class ForgotPasswordScreen: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var errorEmailUiLabel: UILabel!
    @IBOutlet private weak var restorePasswordScreenLabel: UILabel!
    @IBOutlet private weak var restorePasswordButton: UIButton!
    
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
        self.view.backgroundColor = .systemGray3
        self.title = "Restoration Password"
        self.restorePasswordButton.isEnabled = false
        self.errorEmailUiLabel.isHidden = true
    }
    
    private func setupTextFields() {
        setupTextFieldsManager.setup(with: emailTextField, placeholder: "@Email", textContentType: .emailAddress)
    }
    
    private func setupButtons() {
        setupUIButtonManager.setupButton(with: restorePasswordButton, color: .systemGreen, title: "Restore Password")
    }
    
    //MARK: Functions
    
    private func validate() {
        let resultOfValidationEmail = validationManager.validateEmail(emailTextField: self.emailTextField,
                                                                      emailErrorLabel: self.errorEmailUiLabel)
        if resultOfValidationEmail {
            restorePasswordButton.isEnabled = true
        } else {
            restorePasswordButton.isEnabled = false
        }
    }
    
    //MARK: Actions
    
    @IBAction private func restorePasswordButtonTapped() {
        self.navigationManager.showController(StoryboardsNamesKeys.SignIn.rawValue,
                                              ViewControllersIdentifiersKeys.ApplicationSignInScreen.rawValue,
                                              self)
    }
    
    @IBAction private func validateTextFields() {
        validate()
    }
}
