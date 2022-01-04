//
//  SignIn.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit
import SwiftUI

final class ApplicationSignInScreen: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorEmailUiLabel: UILabel!
    @IBOutlet private weak var errorPasswordUiLabel: UILabel!
    @IBOutlet private weak var signInScreenLabel: UILabel!
    @IBOutlet private weak var restorePasswordButton: UIButton!
    @IBOutlet private weak var signInButton: UIButton!
    
    //MARK: Services
    
    private let setupUIButtonManager = SetupUIButtonsManager()
    private let navigationManager = NavigationManager()
    private let setupTextFieldsManager = SetupTextFieldsManager()
    
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
        setupTextFieldsManager.setup(with: emailTextField, placeholder: "@Email", textContentType: .emailAddress)
        setupTextFieldsManager.setup(with: passwordTextField, placeholder: "Password", textContentType: .password, isSecureTextEntry: true)
    }
    
    private func setupButtons() {
        setupUIButtonManager.setupButton(with: signInButton, color: .systemGreen, title: "Sign In")
        setupUIButtonManager.setupButton(with: restorePasswordButton, color: .clear, title: "Restore Password")
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
        self.navigationManager.showController(StoryboardsNamesKeys.ForgotPassword.rawValue,
                                              ViewControllersIdentifiersKeys.ForgotPasswordScreen.rawValue,
                                              self)
    }
    
    @IBAction private func signInButtonTapped() {
        self.navigationManager.showController(StoryboardsNamesKeys.MainTabBarController.rawValue,
                                              ViewControllersIdentifiersKeys.MainTabBarController.rawValue,
                                              self,
                                              navigationBarIsHidden: true)
    }
    
    @objc private func leftBarButtonItemTapped() {
        self.navigationManager.showController(StoryboardsNamesKeys.AuthWelcome.rawValue,
                                              ViewControllersIdentifiersKeys.AuthWelcomeScreen.rawValue,
                                              self)
    }
}
