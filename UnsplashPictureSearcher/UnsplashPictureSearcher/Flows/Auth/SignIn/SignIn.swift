//
//  SignIn.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class ApplicationSignInScreen: UIViewController {
    
    //MARK: ViewLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.view.backgroundColor = .systemGray3
        self.title = "Sign In"
    }
}
