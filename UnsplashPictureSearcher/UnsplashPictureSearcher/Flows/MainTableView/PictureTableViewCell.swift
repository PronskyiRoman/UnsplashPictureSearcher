//
//  PictureTableViewCell.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 03.01.2022.
//

import UIKit

final class PictureTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    static let reuseidentifier = "pictureTableViewCell"
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var photographerNameLabel: UILabel!
    @IBOutlet private weak var pictureImageView: UIImageView!
    
    //MARK: Functions
    
}
