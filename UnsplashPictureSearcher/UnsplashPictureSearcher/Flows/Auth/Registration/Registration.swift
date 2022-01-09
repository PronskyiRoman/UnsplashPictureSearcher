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
    
    private let setupUIButtonManager = SetupUIButtonsManager()
    private let navigationManager = NavigationManager()
    private let setupTextFieldsManager = SetupTextFieldsManager()
    ///validate
    private var stringForValidate: [Character] = []

    
    //MARK: ViewLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextFields()
        setupButtons()
        ///validate
        signUpButton.isEnabled = false
    }
    ///validate
    ///
    private func getTextFieldTextForValidate() {

        guard let textPass1 = passwordTextField.text,
              let textPass2 = confirmPasswordTextField.text else {return}
        
        if textPass1.count < 8 {
            errorPasswordUiLabel.isHidden = false
            errorPasswordUiLabel.text = "Passvord is short"
        } else {
            errorPasswordUiLabel.isHidden = true
        }
        
        if textPass1 != textPass2 && textPass1 != "" && textPass2 != "" {
            errorIsNotPasswordUiLabel.isHidden = false
            errorIsNotPasswordUiLabel.text = "Passvords not same"
            signUpButton.isEnabled = false
        } else {
            errorIsNotPasswordUiLabel.isHidden = true
        }
        if  textPass1 == "" || textPass2 == "" {
            signUpButton.isEnabled = false
        }
        if textPass1 == textPass2 && textPass1.count >= 8 && textPass2.count >= 8 {
            signUpButton.isEnabled = true
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    }
    
    @IBAction func tipingPass(_ sender: Any) {
        getTextFieldTextForValidate()
    }

    
    ///
    //MARK: SetupUI
    
    private func setupUI() {
        self.title = "Registration"
        self.view.backgroundColor = .systemGray3
    }
    
    private func setupTextFields() {
        setupTextFieldsManager.setup(with: emailTextField, placeholder: "@Email", textContentType: .emailAddress)
        setupTextFieldsManager.setup(with: passwordTextField, placeholder: "Password", textContentType: .password, isSecureTextEntry: true)
        setupTextFieldsManager.setup(with: confirmPasswordTextField, placeholder: "Confirm Password", textContentType: .password, isSecureTextEntry: true)
    }
    
    private func setupButtons() {
        setupUIButtonManager.setupButton(with: signUpButton, color: .blue, title: "Sign Up", tintTextColor: .white)
    }
    
    //MARK: Actions
    
    @IBAction private func signUpButtonTapped() {
        self.navigationManager.showController(StoryboardsNamesKeys.MainTabBarController.rawValue,
                                              ViewControllersIdentifiersKeys.MainTabBarController.rawValue,
                                              self,
                                              navigationBarIsHidden: true)
        ///validate
        ///
       
    }
    ///validate
}
