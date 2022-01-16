//
//  NSPredicateEmail.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 16.01.2022.
//

import Foundation

extension String {
    func isEmail()->Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}
