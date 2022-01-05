//
//  SetupKeyboardService.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 03.01.2022.
//

import UIKit

final class KeyboardManager {
    
    //MARK: Properties
    
    private var tapGestureRecognizer: UIGestureRecognizer
    private var scrollView: UIScrollView
    private var controller: UIViewController
    
    //MARK: Init
    
    init (tapGestureRecognizer: UIGestureRecognizer, scrollView: UIScrollView, controller: UIViewController) {
        self.tapGestureRecognizer = tapGestureRecognizer
        self.scrollView = scrollView
        self.controller = controller
        setupKeyboard()
    }
    
    //MARK: Functions
    
    private func setupKeyboard() {
        addTarget()
        hideKeyboard()
        keyboardWillShow()
        keyboardWillHide()
    }
    
    private func addTarget() {
        self.controller.view.addGestureRecognizer(self.tapGestureRecognizer)
        self.tapGestureRecognizer.delegate = self.controller as? UIGestureRecognizerDelegate
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.hideKeyboard))
    }
    
    @IBAction private func hideKeyboard() {
        self.controller.view.endEditing(true)
    }
    
    private func keyboardWillShow() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: { notification in
            if let endFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                self.scrollView.contentInset = UIEdgeInsets(top: 0,
                                                            left: 0,
                                                            bottom: endFrame.size.height + 20,
                                                            right: 0)
            }
        })
    }
    
    private func keyboardWillHide() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: { notification in
            self.scrollView.contentInset = UIEdgeInsets.zero
        })
    }
}
