//
//  ValidationManager.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 09.01.2022.
//

import UIKit

final class ValidationManager {
    
    //MARK: Functions
    
    func validate(textField: UITextField, errorLabel: UILabel) {
        textField.text?.dropFirst()
    }
    
    var validateString: [Character]?
}
