//
//  PictureTableView.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 03.01.2022.
//

import UIKit

final class PictureTableView: UIViewController {
    
    //MARK: Properties
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var pictureTableView: UITableView!
    
    //MARK: LoadView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBarItem()
    }
    
    //MARK: SetupUI
    
    func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: "Main",
                                       image: .init(systemName: "list.bullet.rectangle.portrait"),
                                       tag: 0)
    }
    
    func setupTableView() {
        self.pictureTableView.delegate = self
        self.pictureTableView.dataSource = self
        self.pictureTableView.rowHeight = UITableView.automaticDimension
        self.pictureTableView.register(UINib(nibName: "PictureTableViewCell", bundle: nil), forCellReuseIdentifier: PictureTableViewCell.reuseidentifier)
    }
}

//MARK: Extensions

extension PictureTableView: UITableViewDelegate {
    
}

extension PictureTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PictureTableViewCell.reuseidentifier, for: indexPath) as? PictureTableViewCell {
            //TODO setupCells
            return cell
        }
        return UITableViewCell()
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        let sizeForCell = CGSize(width: self.view.frame.size.width,
                                 height: self.view.frame.size.width)
        return sizeForCell
    }
}
