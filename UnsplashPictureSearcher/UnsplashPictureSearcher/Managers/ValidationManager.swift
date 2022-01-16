//
//  ValidationManager.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 09.01.2022.
//

import UIKit

final class ValidationManager {
    
    //MARK: Functions
    
    func validateEmail(emailTextField: UITextField, emailErrorLabel: UILabel) -> Bool {
        var validateResult: Bool = false
        let arrayErrorsTextLabels: [UILabel?] = [emailErrorLabel]
        setupErrorTextLabels(error: arrayErrorsTextLabels)
        if let textfieldText = emailTextField.text {
            if textfieldText.isEmail() {
                emailErrorLabel.isHidden = true
                validateResult = true
            } else {
                emailErrorLabel.isHidden = false
                emailErrorLabel.text = "Enter a valid email address"
                validateResult = false
            }
        }
        return validateResult
    }
    
    func validatePassword(passwordTextField: UITextField, confirmPasswordTextField: UITextField? = nil, errorPasswordLabel: UILabel, confirmPasswordErrorLabel: UILabel? = nil) -> Bool {
        var validateResult: Bool = false
        let arrayErrorsTextLabels: [UILabel?] = [errorPasswordLabel, confirmPasswordErrorLabel]
        setupErrorTextLabels(error: arrayErrorsTextLabels)
        //for one passwordTextField
        if passwordTextField.text != nil {
            guard let password = passwordTextField.text else { return validateResult }
            if password.count >= 8 {
                errorPasswordLabel.isHidden = true
                validateResult = true
            } else if password.isEmpty == false {
                errorPasswordLabel.isHidden = false
                errorPasswordLabel.text = "Passvord is short"
                validateResult = false
            }
        }
        //for two passwodsTextFields
        if let confirmPasswordTextField = confirmPasswordTextField,
           let confirmPasswordErrorLabel = confirmPasswordErrorLabel {

            guard let password = passwordTextField.text,
                  let confirmPassword = confirmPasswordTextField.text else { return validateResult }
            if password.count >= 8 {
                errorPasswordLabel.isHidden = true
            } else if password.isEmpty == false {
                errorPasswordLabel.isHidden = false
                errorPasswordLabel.text = "Passvord is short"
            }
            
            if password != confirmPassword && password != "" && confirmPassword != "" {
                confirmPasswordErrorLabel.isHidden = false
                confirmPasswordErrorLabel.text = "Passvords not same"
                validateResult = false
            } else if password == confirmPassword && password.count >= 8 && confirmPassword.count >= 8 {
                confirmPasswordErrorLabel.isHidden = true
                validateResult = true
            }
            
            if  password == "" || confirmPassword == "" {
                validateResult = false
            }
        }
        return validateResult
    }
    
    //MARK: SetupErrorLabels
    
    private func setupErrorTextLabels(error: [UILabel?]) {
        error.forEach { label in
            label?.textColor = .red
            label?.font = UIFont(descriptor: UIFontDescriptor.init(), size: 8.0)
        }
    }
}
