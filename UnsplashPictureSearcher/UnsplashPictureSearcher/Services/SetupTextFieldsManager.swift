//
//  SetupTextFieldsServices.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 04.01.2022.
//

import UIKit

final class SetupTextFieldsManager {
    
    //MARK: Functions
    
    func setup(with textField: UITextField, placeholder: String, textContentType: UITextContentType, isSecureTextEntry: Bool = false) {
        textField.placeholder = placeholder
        textField.textContentType = textContentType
        textField.isSecureTextEntry = isSecureTextEntry
    }
}
