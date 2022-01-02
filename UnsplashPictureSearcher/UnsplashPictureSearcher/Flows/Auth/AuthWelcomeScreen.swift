//
//  File.swift
//  UnsplashPictureSearcher
//
//  Created by Рома on 30.12.2021.
//

import UIKit

final class AuthWelcomeScreen: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet private weak var applicationNameLabel: UILabel!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var forgotPasswordButton: UIButton!
    private let navigationService = NavigationService()
    
    
    //MARK: ViewLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.signInButton.setTitle("Sign In", for: .normal)
        self.signUpButton.setTitle("Sign Up", for: .normal)
        self.forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        self.applicationNameLabel.text = "Unsplash Picture Searcher"
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
