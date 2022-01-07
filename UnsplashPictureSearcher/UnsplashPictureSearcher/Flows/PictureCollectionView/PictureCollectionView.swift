//
//  CollectionView.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 06.01.2022.
//

import UIKit

final class PictureCollectionView: UICollectionViewController {
    
    //MARK: Properties
    
    private let networkManager = APIClient()
    private let setInsetsForCell = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    private let lineSpacingForCollectionView: Int = 6
    private let countItemsInRowForCollectionView: Float = 3.3
    private let countItemsInLineForCollectionView: Float = 4
    private var detailsStructure: [NestedPictureModel]?
     
    //MARK: init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBarItem()
    }
    
    //MARK: LoadVIew
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        dataRequest()
        setupCollectionView()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.title = "Collection"
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "list.bullet.rectangle.portrait"), tag: 0)
    }
    
    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "PictureCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PictureCollectionViewCell.reuseidentifier)
    }
    
    //MARK: Networking
    
    private func setDataToStruct(from model: PictureModel) {
        self.detailsStructure = model.responceData
        self.collectionView.reloadData()
    }
    
    private func dataRequest() {
        self.networkManager.fechDataRequestForTableView(completion: setDataToStruct)
    }
}

//MARK: UICollectionViewDataSource

extension PictureCollectionView {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.reuseidentifier, for: indexPath) as! PictureCollectionViewCell
        guard let detailsStructure = self.detailsStructure else {return cell}
        cell.setupCells(with: detailsStructure[indexPath.row])
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension PictureCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingsForRow = setInsetsForCell.left * CGFloat(countItemsInRowForCollectionView + 1)
        let freeSpaceForRow = self.view.frame.size.width - paddingsForRow
        let spaceForItemInRow = freeSpaceForRow / CGFloat(countItemsInRowForCollectionView)
        
        let paddingsForHeight = setInsetsForCell.top * CGFloat(countItemsInLineForCollectionView + 1)
        let freeSpaceForHeight = self.collectionView.safeAreaLayoutGuide.layoutFrame.height - paddingsForHeight
        let spaceForItemInLine = freeSpaceForHeight / CGFloat(countItemsInLineForCollectionView)
        let size = CGSize(width: spaceForItemInRow, height: spaceForItemInLine)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return setInsetsForCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(lineSpacingForCollectionView)
    }
}
