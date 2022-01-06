//
//  KFextensionUiImage.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 05.01.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(imageUrl: String) {
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
