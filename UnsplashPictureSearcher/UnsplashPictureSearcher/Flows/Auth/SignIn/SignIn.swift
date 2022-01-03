//
//  SignIn.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit
import SwiftUI

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLeftBarButtonItem()
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
    
    private func setupLeftBarButtonItem() {
        let backItem = UIButton()
        backItem.setTitle(" Back", for: .normal)
        backItem.setTitleColor(.systemBlue, for: .normal)
        backItem.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backItem.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        backItem.addTarget(self, action: #selector(leftBarButtonItemTapped), for: .allEvents)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backItem)
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
                                              self,
                                              navigationBarIsHidden: true)
    }
    
    @objc private func leftBarButtonItemTapped() {
        self.navigationService.showController(StoryboardsNamesKeys.AuthWelcome.rawValue,
                                              ViewControllersIdentifiersKeys.AuthWelcomeScreen.rawValue,
                                              self)
    }
}
