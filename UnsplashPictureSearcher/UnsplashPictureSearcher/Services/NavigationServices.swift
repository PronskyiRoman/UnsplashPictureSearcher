//
//  NavigationServices.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import UIKit

final class NavigationService {
    
    //MARK: Functions
    
    func showController(_ storyboardName: String,_ controllerIdentifier: String, _ controller: UIViewController) {
        let storyboard1 = UIStoryboard(name: storyboardName, bundle: nil)
        let controller1 = storyboard1.instantiateViewController(withIdentifier: controllerIdentifier)
        controller1.modalPresentationStyle = .fullScreen
        controller1.modalTransitionStyle = .crossDissolve
        controller.navigationController?.show(controller1, sender: controller)
    }
}

