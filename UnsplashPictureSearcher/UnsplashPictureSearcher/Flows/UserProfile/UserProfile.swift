//
//  UserProfile.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 03.01.2022.
//

import UIKit

final class UserProfileScreen: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: Properties
    
    @IBOutlet private weak var userProfileLabel: UILabel!
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var userInfoTextView: UITextView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var changePasswordLabel: UILabel!
    @IBOutlet private weak var agreemenchangePasswordUISwitch: UISwitch!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var agreementLabel: UILabel!
    @IBOutlet private weak var agreemenUISwitch: UISwitch!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var editButton: UIButton!
    @IBOutlet private weak var usersProfileImageView: UIImageView!
    
//    private let keyboardServise = SetupKeyboardService(tapGestureRecognizer: tapGestureRecognizer, scrollView: T##UIScrollView, controller: T##UIViewController)
//    let tapGestureRecognizer = UITapGestureRecognizer()
    
    //MARK: LoadView
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tapGestureRecognizer.delegate = self
//        keyboardServise()
    }
}
