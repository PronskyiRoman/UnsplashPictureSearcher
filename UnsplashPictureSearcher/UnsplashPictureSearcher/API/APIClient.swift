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
    
    //MARK: requestForPictureTableView
    
    func fechDataRequestForTableView(by searchQuery: String? = "Photo",
                                     requestItemsPerPage: Int = 10,
                                     completion: @escaping(PictureModel) -> Void) {
        guard let searchQuery = searchQuery else { return }
        AF.request(self.apiClientUrl + "/search/photos?per_page=\(requestItemsPerPage)&query=\(searchQuery)\(self.clientPrivateKey)", method: .get).responseDecodable(of: PictureModel.self) { responce in
            guard let responceValue = responce.value else { return }
            completion(responceValue)
        }
    }
    
    //MARK: requestFotScrollView
    
    func fechDateRequestFotScrollView() {
        
    }
    
    //MARK: requestForDetailedTableView
    
    func fechDataRequestForDetailedTableView(completion: @escaping(DetailedViewModel) -> Void) {
    //    if let selectedProtoIndex = PictureTableViewController.selectedProtoIndex {
    //        guard PictureTableViewCell.idForPfoto.count >=  selectedProtoIndex else { return }
        //PictureTableViewCell.idForPfoto[selectedProtoIndex]
        AF.request(self.apiClientUrl + "/photos/\("")\(self.clientPrivateKey)", method: .get).responseDecodable(of: DetailedViewModel.self) {  responce in
                guard let responceValue = responce.value else { return }
                completion(responceValue)
            }
        }
    
    //MARK: requestForDetailedCollectionView
    
    func fetchDataRequestForDetailedCollectionView(completion: @escaping(DetailedViewModel) -> Void) {
       // if let selectedProtoIndex = ForestCollectionViewController.selectedIndexPath {
       //     guard ForestCollectionViewCell.idForPfoto.count >=  selectedProtoIndex else { return }
        // ForestCollectionViewCell.idForPfoto[selectedProtoIndex]
            AF.request(self.apiClientUrl + "/photos/\("")\(self.self.clientPrivateKey)", method: .get).responseDecodable(of: DetailedViewModel.self) {  responce in
                guard let responceValue = responce.value else { return }
                completion(responceValue)
            }
        }
    }





