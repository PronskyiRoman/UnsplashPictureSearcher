//
//  DetailedPicture.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 07.01.2022.
//

import UIKit

final class DetailedPictureScreen: UIViewController {
    
    //MARK: Propertyes
    
    var detailedPictureIdentifier : String?
    
    //MARK: Managers
    
    private let networkManager = APIClient()
    
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
        dataRequest()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.title = "Detailed Screen"
    }
    
    private func setupResponceData(from model: DetailedViewModel) {
        currentImageUiImageView.setImage(imageUrl: model.currentImage)
        photographerProfileImageUiImageView.setImage(imageUrl: model.userProfileImage ?? "Image not found")
        currentImageDescriptionUiLabel.text = model.imageDescription
        currentImageLocationUiLabel.text = model.imageLocation
        dateOfCreationCurrentImageUiLabel.text = model.dateOfCreation
        photographerFirstNameUiLabel.text = model.firstName
        photographerLastNameUiLabel.text = model.lastName
        photographerInfoUiLabel.text = model.bioText
        if let countPhoto = model.totalPhotoesCount {
            totalPhotoByPhotographerUiLabel.text = "photos \(countPhoto)"
        }
        photographerInstagramNickNameUiLabel.text = model.instagramLink
        photographerTwitterNickNameUiLabel.text = model.twitterLink
    }
    
    //MARK: DataRequest
    
    private func dataRequest() {
        guard let detailedPictureIdentifier = self.detailedPictureIdentifier else { return }
        self.networkManager.fetchDataRequestForDetailedScreen(searchQuery: detailedPictureIdentifier, completion: setupResponceData)
    }
}
