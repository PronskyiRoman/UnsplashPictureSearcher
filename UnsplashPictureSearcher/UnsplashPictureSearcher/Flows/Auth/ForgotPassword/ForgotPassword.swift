//
//  ForgotPassword.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class ForgotPasswordScreen: UIViewController {
    
    //MARK: ViewLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.view.backgroundColor = .systemGray3
        self.title = "Restoration Password"
    }
}
