//
//  PictureModel.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 02.01.2022.
//

import Foundation

struct PictureModel {
    
    //MARK: Propertyes
    
    var responceData: [NestedPictureModel]
    
    //MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

//MARK: init from decoder PictureModel

extension PictureModel: Decodable {
    init(from decoder: Decoder) throws {
        let result = try decoder.container(keyedBy: CodingKeys.self)
        responceData = try result.decode([NestedPictureModel].self, forKey: .results)
    }
}

struct NestedPictureModel {
    
    //MARK: Propertyes
    
    let pictureID: String
    let photographerName: String
    let pictureURL: String
    
    //MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case pictureID = "id"
        case pictureURL = "urls"
        case user
    }
    
    enum AdditionalCodingUrlKeys: String, CodingKey {
        case regular
    }
    
    enum AdditionalCodingNameKeys: String, CodingKey {
        case name
    }
}

//MARK: init from decoder PictureModel

extension NestedPictureModel: Decodable {
    init(from decoder: Decoder) throws {
        let results = try decoder.container(keyedBy: CodingKeys.self)
        pictureID = try results.decode(String.self, forKey: .pictureID)
        let urlForImage = try results.nestedContainer(keyedBy: AdditionalCodingUrlKeys.self, forKey: .pictureURL)
        pictureURL = try urlForImage.decode(String.self, forKey: .regular)
        let name = try results.nestedContainer(keyedBy: AdditionalCodingNameKeys.self, forKey: .user)
        photographerName = try name.decode(String.self, forKey: .name)
    }
}

