//
//  APIClient.swift
//  UnsplashPictureSearcher
//
//  Created by Рома on 30.12.2021.
//

import Alamofire

final class APIClient {
    
    //MARK: Properties
    
    private let apiClientUrl = "https://api.unsplash.com"
    private let clientPrivateKey = "?&client_id=e_sbNrFSBhUP6J2xBAKQUDKk-L0WKG7Zn5aIIAX4fWU"
    
    //MARK: fechDataRequest
    
    func fechDataRequest(by searchQuery: String? = "Photo",
                                     requestItemsPerPage: Int = 30,
                                     completion: @escaping(PictureModel) -> Void) {
        guard let searchQuery = searchQuery else { return }
        AF.request(self.apiClientUrl + "/search/photos?per_page=\(requestItemsPerPage)&query=\(searchQuery)\(self.clientPrivateKey)", method: .get).responseDecodable(of: PictureModel.self) { responce in
            guard let responceValue = responce.value else { return }
            completion(responceValue)
        }
    }
    
    //MARK: fetchDataRequestForDetailedScreen
    
    func fetchDataRequestForDetailedScreen(searchQuery: String, completion: @escaping(DetailedViewModel) -> Void) {
            AF.request(self.apiClientUrl + "/photos/\(searchQuery)\(self.self.clientPrivateKey)", method: .get).responseDecodable(of: DetailedViewModel.self) {  responce in
                guard let responceValue = responce.value else { return }
                completion(responceValue)
            }
        }
    }
