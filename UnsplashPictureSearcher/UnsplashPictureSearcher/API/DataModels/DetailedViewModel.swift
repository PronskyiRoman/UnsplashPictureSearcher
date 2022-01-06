//
//  DetailedViewModel.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import Foundation

struct DetailedViewModel {
    
    //MARK: Propertyes
    
    var photoID: String
    var userProfileImage: String?
    var firstName: String?
    var lastName: String?
    var bioText: String?
    var totalPhotoesCount: Int?
    var instagramLink: String?
    var twitterLink: String?
    var currentImage: String
    var imageDescription: String? = "Have not"
    var imageLocation: String? = "Not Found"
    var dateOfCreation: String? = "Not found"
    
    //MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case dateOfCreation = "created_at"
        case imageDescription = "alt_description"
        case user
        case currentImage = "urls"
        case id
    }
    
    enum CodingKeysForUserKey: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case bioText = "bio"
        case imageLocation = "location"
        case profileLinks = "links"
        case userProfileImage = "profile_image"
        case totalPhotos = "total_photos"
        case social
    }
    
    enum AdditionalCodingKeysSocialKey: String, CodingKey {
        case instagramLink = "instagram_username"
        case twitterLink = "twitter_username"
    }
    
    enum AdditionalCodingKeysUserProfileImageKey: String, CodingKey {
        case large
    }
    
    enum AdditionalCodingKeysUrlsKey: String, CodingKey {
        case small
    }
}

//MARK: init from decoder DetailedViewModel

extension DetailedViewModel: Decodable {
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        dateOfCreation = try value.decode(String.self, forKey: .dateOfCreation)
        imageDescription = try value.decode(String?.self, forKey: .imageDescription)
        photoID = try value.decode(String.self, forKey: .id)
        let currentImageUrls = try value.nestedContainer(keyedBy: AdditionalCodingKeysUrlsKey.self, forKey: .currentImage)
        currentImage = try currentImageUrls.decode(String.self, forKey: .small)
        let users = try value.nestedContainer(keyedBy: CodingKeysForUserKey.self, forKey: .user)
        firstName = try users.decode(String.self, forKey: .firstName)
        lastName = try users.decode(String?.self, forKey: .lastName)
        bioText = try users.decode(String?.self, forKey: .bioText)
        imageLocation = try users.decode(String?.self, forKey: .imageLocation)
        totalPhotoesCount = try users.decode(Int?.self, forKey: .totalPhotos)
        let usersProfileImage = try users.nestedContainer(keyedBy: AdditionalCodingKeysUserProfileImageKey.self, forKey: .userProfileImage)
        userProfileImage = try usersProfileImage.decode(String?.self, forKey: .large)
        let social = try users.nestedContainer(keyedBy: AdditionalCodingKeysSocialKey.self, forKey: .social)
        instagramLink = try social.decode(String?.self, forKey: .instagramLink)
        twitterLink = try social.decode(String?.self, forKey: .twitterLink)
    }
}

