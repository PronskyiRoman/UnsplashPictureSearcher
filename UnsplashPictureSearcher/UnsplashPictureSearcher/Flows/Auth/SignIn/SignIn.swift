//
//  SignIn.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class ApplicationSignInScreen: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorEmailUiLabel: UILabel!
    @IBOutlet private weak var errorPasswordUiLabel: UILabel!
    @IBOutlet private weak var signInScreenLabel: UILabel!
    @IBOutlet private weak var restorePasswordButton: UIButton!
    @IBOutlet private weak var signInButton: UIButton!
    private let setupUIButtonService = SetupUIButtons()
    private let navigationService = NavigationService()
    
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
        self.title = "Sign In"
    }
    
    private func setupTextFields() {
        self.emailTextField.placeholder = "@Email"
        self.passwordTextField.placeholder = "Password"
        self.passwordTextField.textContentType = .password
        self.emailTextField.textContentType = .emailAddress
        self.passwordTextField.isSecureTextEntry = true
    }
    
    private func setupButtons() {
        setupUIButtonService.setupButton(with: signInButton, color: .systemGreen, title: "Sign In")
        setupUIButtonService.setupButton(with: restorePasswordButton, color: .clear, title: "Restore Password")
    }
    
    //MARK: Actions
    
    @IBAction private func forgotPasswordButtonTapped() {
        self.navigationService.showController(StoryboardsNamesKeys.ForgotPassword.rawValue,
                                              ViewControllersIdentifiersKeys.ForgotPasswordScreen.rawValue,
                                              self)
    }
    
    @IBAction private func signInButtonTapped() {
        self.navigationService.showController(StoryboardsNamesKeys.MainTabBarController.rawValue,
                                              ViewControllersIdentifiersKeys.MainTabBarController.rawValue,
                                              self)
    }
}
