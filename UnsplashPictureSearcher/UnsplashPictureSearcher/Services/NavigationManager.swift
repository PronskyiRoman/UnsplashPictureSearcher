//
//  NavigationServices.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class NavigationManager {
    
    //MARK: Functions
    
    func showController(_ storyboardName: String,_ controllerIdentifier: String, _ controller: UIViewController, navigationBarIsHidden: Bool = false, leftBarButtonItemIsHidden: Bool = false) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let presentedController = storyboard.instantiateViewController(withIdentifier: controllerIdentifier)
        presentedController.modalPresentationStyle = .fullScreen
        presentedController.modalTransitionStyle = .crossDissolve
        controller.navigationController?.show(presentedController, sender: controller)
        controller.navigationController?.navigationBar.isHidden = navigationBarIsHidden
        if leftBarButtonItemIsHidden == true {
            controller.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        } else {
            return
        }
    }
}

