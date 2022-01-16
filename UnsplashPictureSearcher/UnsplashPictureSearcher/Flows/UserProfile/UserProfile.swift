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
    let placeholderForTextView = "User info"
    
    //MARK: Services
    
    private let setupUIButtonManager = SetupUIButtonsManager()
    private let setupTextFieldsManager = SetupTextFieldsManager()
    private let validationManager = ValidationManager()
    
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
    @IBOutlet private weak var userProfileContentView: UIView!
    @IBOutlet private weak var errorEmailUiLabel: UILabel!
    @IBOutlet private weak var errorPasswordUiLabel: UILabel!
    @IBOutlet private weak var errorConfirmtPasswordUiLabel: UILabel!
    
    //MARK: Init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBarItem()
    }
    
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
        self.usersProfileImageView.backgroundColor = .systemGray
        self.agreementLabel.text = agreementString
        self.userProfileContentView.backgroundColor = .systemGray4
        self.userInfoTextView.layer.cornerRadius = 5
        self.userInfoTextView.text = placeholderForTextView
        self.userInfoTextView.delegate = self
        self.errorEmailUiLabel.isHidden = true
        self.errorPasswordUiLabel.isHidden = true
        self.errorConfirmtPasswordUiLabel.isHidden = true
    }
    
    private func setupTextFields() {
        setupTextFieldsManager.setup(with: firstNameTextField, placeholder: "First Name", textContentType: .name)
        setupTextFieldsManager.setup(with: lastNameTextField, placeholder: "Last Name", textContentType: .familyName)
        setupTextFieldsManager.setup(with: emailTextField, placeholder: "@Email", textContentType: .emailAddress)
        setupTextFieldsManager.setup(with: passwordTextField, placeholder: "Password", textContentType: .password, isSecureTextEntry: true)
        setupTextFieldsManager.setup(with: confirmPasswordTextField, placeholder: "Confirm Password", textContentType: .password, isSecureTextEntry: true)
    }
    
    private func setupButtons() {
        setupUIButtonManager.setupButton(with: changePasswordUiButton, color: .clear, title: "Do you want to change password?")
        setupUIButtonManager.setupButton(with: saveButton, color: .systemGreen, title: "Save", tintTextColor: .white)
        setupUIButtonManager.setupButton(with: editButton, color: .systemBlue, title: "Edit", tintTextColor: .white)
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: "User Profile", image: UIImage(systemName: "person"), tag: 0)
    }
    
    private func setupKeyboard() {
        _ = KeyboardManager(tapGestureRecognizer: tapGestureRecognizer, scrollView: userProfileScrollView, controller: self)
    }
    
    //MARK: Functions
    
    private func validate() {
        let resultOfValidationEmail = validationManager.validateEmail(emailTextField: self.emailTextField,
                                                                      emailErrorLabel: self.errorEmailUiLabel)
        let resultOfValidationPassword = validationManager.validatePassword(passwordTextField: self.passwordTextField,
                                                                            confirmPasswordTextField: self.confirmPasswordTextField,
                                                                            errorPasswordLabel: self.errorPasswordUiLabel,
                                                                            confirmPasswordErrorLabel: self.errorConfirmtPasswordUiLabel)
        if resultOfValidationEmail && resultOfValidationPassword {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    //MARK: Actions
    
    @IBAction private func validateTextFields() {
        validate()
    }
    
}

//MARK: UITextViewDelegate

extension UserProfileScreen: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if userInfoTextView.text == placeholderForTextView {
            userInfoTextView.text = ""
        }
        var frame = textView.frame
        frame.size.height += 30
        self.userInfoTextView.scrollRectToVisible(frame, animated: true)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.userInfoTextView.text == "" {
            self.userInfoTextView.text = self.placeholderForTextView
        }
    }
}
