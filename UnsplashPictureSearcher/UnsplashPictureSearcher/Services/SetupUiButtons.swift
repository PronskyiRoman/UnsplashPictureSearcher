//
//  SetupUiButtons.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class SetupUIButtons: UIButton {
    
    //MARK: Functions
    
    func setupButton(with button: UIButton, color: UIColor, cornerRadius: Int = 16, title: String, tintTextColor: UIColor = .systemBlue) {
        button.layer.cornerRadius = CGFloat(cornerRadius)
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
        button.tintColor = tintTextColor
    }
}
