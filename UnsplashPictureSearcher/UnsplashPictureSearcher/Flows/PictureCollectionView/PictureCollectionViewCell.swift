//
//  CollectionViewCell.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 06.01.2022.
//

import UIKit

final class PictureCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    
    static let reuseidentifier = "pictureCollectionViewCell"
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var photographerNameLabel: UILabel!
    @IBOutlet private weak var pictureImageView: UIImageView!
    
    //MARK: Functions
    
    func setupCells(with structure: NestedPictureModel) {
        photographerNameLabel.textAlignment = .center
        self.photographerNameLabel.text = "Photographer - \(structure.photographerName)"
        self.pictureImageView.setImage(imageUrl: structure.pictureURL)
    }
}
