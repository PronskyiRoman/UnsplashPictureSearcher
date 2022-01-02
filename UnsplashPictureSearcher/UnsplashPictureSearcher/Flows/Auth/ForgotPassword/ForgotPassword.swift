//
//  ForgotPassword.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class ForgotPasswordScreen: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var errorEmailUiLabel: UILabel!
    @IBOutlet private weak var restorePasswordScreenLabel: UILabel!
    @IBOutlet private weak var restorePasswordButton: UIButton!
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
        self.title = "Restoration Password"
    }
    
    private func setupTextFields() {
        self.emailTextField.placeholder = "@Email"
        self.emailTextField.textContentType = .emailAddress
    }
    
    private func setupButtons() {
        setupUIButtonService.setupButton(with: restorePasswordButton, color: .systemGreen, title: "Restore Password")
    }
    
    //MARK: Actions
    
    @IBAction private func restorePasswordButtonTapped() {
        self.navigationService.showController(StoryboardsNamesKeys.SignIn.rawValue,
                                              ViewControllersIdentifiersKeys.ApplicationSignInScreen.rawValue,
                                              self)
    }
}
