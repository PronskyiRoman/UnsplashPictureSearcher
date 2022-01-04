//
//  UserProfile.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 03.01.2022.
//

import UIKit

final class UserProfileScreen: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: Properties
    
    let agreementString: String = "I agree with the privacy policy"
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    //MARK: Services
    
    private let setupUIButtonService = SetupUIButtonsManager()
    private let setupTextFieldsServices = SetupTextFieldsManager()
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var userProfileLabel: UILabel!
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var userInfoTextView: UITextView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var changePasswordUiButton: UIButton!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var agreementLabel: UILabel!
    @IBOutlet private weak var agreemenUISwitch: UISwitch!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var editButton: UIButton!
    @IBOutlet private weak var usersProfileImageView: UIImageView!
    @IBOutlet private weak var userProfileScrollView: UIScrollView!
    
    
    //MARK: LoadView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextFields()
        setupButtons()
        setupKeyboard()
    }
    
    //MARK: SetupUi
    
    private func setupUI() {
        self.usersProfileImageView.backgroundColor = .systemGray3
        self.agreementLabel.text = agreementString
    }
    
    private func setupTextFields() {
        setupTextFieldsServices.setup(with: firstNameTextField, placeholder: "First Name", textContentType: .name)
        setupTextFieldsServices.setup(with: lastNameTextField, placeholder: "Last Name", textContentType: .familyName)
        setupTextFieldsServices.setup(with: emailTextField, placeholder: "@Email", textContentType: .emailAddress)
        setupTextFieldsServices.setup(with: passwordTextField, placeholder: "Password", textContentType: .password, isSecureTextEntry: true)
        setupTextFieldsServices.setup(with: confirmPasswordTextField, placeholder: "Confirm Password", textContentType: .password, isSecureTextEntry: true)
    }
    
    private func setupButtons() {
        setupUIButtonService.setupButton(with: changePasswordUiButton, color: .clear, title: "Do you want to change password?")
        setupUIButtonService.setupButton(with: saveButton, color: .systemGreen, title: "Save", tintTextColor: .white)
        setupUIButtonService.setupButton(with: editButton, color: .systemBlue, title: "Edit", tintTextColor: .white)
    }
    
    private func setupKeyboard() {
        _ = KeyboardManager(tapGestureRecognizer: tapGestureRecognizer, scrollView: userProfileScrollView, controller: self)
    }
}
