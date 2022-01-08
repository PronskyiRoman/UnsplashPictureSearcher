//
//  DetailedPicture.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 07.01.2022.
//

import UIKit

final class DetailedPictureScreen: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var currentImageUiImageView: UIImageView!
    @IBOutlet private weak var photographerProfileImageUiImageView: UIImageView!
    @IBOutlet private weak var currentImageDescriptionUiLabel: UILabel!
    @IBOutlet private weak var currentImageLocationUiLabel: UILabel!
    @IBOutlet private weak var dateOfCreationCurrentImageUiLabel: UILabel!
    @IBOutlet private weak var photographerFirstNameUiLabel: UILabel!
    @IBOutlet private weak var photographerLastNameUiLabel: UILabel!
    @IBOutlet private weak var photographerInfoUiLabel: UILabel!
    @IBOutlet private weak var totalPhotoByPhotographerUiLabel: UILabel!
    @IBOutlet private weak var photographerInstagramNickNameUiLabel: UILabel!
    @IBOutlet private weak var photographerTwitterNickNameUiLabel: UILabel!
    
    //MARK: LoadView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.title = "Detailed Screen"
        currentImageUiImageView.backgroundColor = .red
        photographerProfileImageUiImageView.backgroundColor = .systemGray
        currentImageDescriptionUiLabel.text = "currentImageDescriptionUiLabel"
        currentImageLocationUiLabel.text = "currentImageLocationUiLabel"
        dateOfCreationCurrentImageUiLabel.text = "dateOfCreationCurrentImageUiLabel"
        photographerFirstNameUiLabel.text = "photographerFirstNameUiLabel"
        photographerLastNameUiLabel.text = "photographerLastNameUiLabel"
        photographerInfoUiLabel.text = "photographerInfoUiLabel"
        totalPhotoByPhotographerUiLabel.text = "totalPhotoByPhotographerUiLabel"
        photographerInstagramNickNameUiLabel.text = "photographerInstagramNickNameUiLabel"
        photographerTwitterNickNameUiLabel.text = "photographerTwitterNickNameUiLabel"
    }
}
