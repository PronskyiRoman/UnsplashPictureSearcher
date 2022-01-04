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
    @IBOutlet private weak var errorIsNotPasswordUiLabel: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    
    //MARK: Services
    
    private let setupUIButtonService = SetupUIButtonsManager()
    private let navigationService = NavigationManager()
    private let setupTextFieldsServices = SetupTextFieldsManager()
    
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
    }
    
    private func setupTextFields() {
        setupTextFieldsServices.setup(with: emailTextField, placeholder: "@Email", textContentType: .emailAddress)
        setupTextFieldsServices.setup(with: passwordTextField, placeholder: "Password", textContentType: .password, isSecureTextEntry: true)
        setupTextFieldsServices.setup(with: confirmPasswordTextField, placeholder: "Confirm Password", textContentType: .password, isSecureTextEntry: true)
    }
    
    private func setupButtons() {
        setupUIButtonService.setupButton(with: signUpButton, color: .blue, title: "Sign Up", tintTextColor: .white)
    }
    
    //MARK: Actions
    
    @IBAction private func signUpButtonTapped() {
        self.navigationService.showController(StoryboardsNamesKeys.MainTabBarController.rawValue,
                                              ViewControllersIdentifiersKeys.MainTabBarController.rawValue,
                                              self,
                                              navigationBarIsHidden: true)
    }
}
