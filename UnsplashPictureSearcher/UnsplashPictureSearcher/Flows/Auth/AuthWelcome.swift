//
//  File.swift
//  UnsplashPictureSearcher
//
//  Created by Рома on 30.12.2021.
//

import UIKit

final class AuthWelcomeScreen: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var applicationNameLabel: UILabel!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var forgotPasswordButton: UIButton!
    
    //MARK: Services
    
    private let navigationService = NavigationManager()
    private let setupUIButtonService = SetupUIButtonsManager()
    
    //MARK: ViewLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtons()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.view.backgroundColor = .systemGray3
        self.applicationNameLabel.text = "Unsplash Picture Searcher"
    }
    
    private func setupButtons() {
        setupUIButtonService.setupButton(with: signInButton, color: .green, title: "Sign In")
        setupUIButtonService.setupButton(with: signUpButton, color: .blue, title: "Sign Up", tintTextColor: .white)
        setupUIButtonService.setupButton(with: forgotPasswordButton, color: .gray, title: "Forgot password?", tintTextColor: .green)
    }
    
    //MARK: Actions
    
    @IBAction private func signInButtonTapped() {
        self.navigationService.showController(StoryboardsNamesKeys.SignIn.rawValue,
                                              ViewControllersIdentifiersKeys.ApplicationSignInScreen.rawValue,
                                              self)
    }
    
    @IBAction private func signUpButtonTapped() {
        self.navigationService.showController(StoryboardsNamesKeys.Registration.rawValue,
                                              ViewControllersIdentifiersKeys.RegistrationScreen.rawValue,
                                              self)
    }
    
    @IBAction private func forgotPasswordButtonTapped() {
        self.navigationService.showController(StoryboardsNamesKeys.ForgotPassword.rawValue,
                                              ViewControllersIdentifiersKeys.ForgotPasswordScreen.rawValue,
                                              self)
    }
}
