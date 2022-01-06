//
//  PictureTableView.swift
//  UnsplashPictureSearcher
//
//  Created by Роман on 03.01.2022.
//

import UIKit

final class PictureTableView: UIViewController {
    
    //MARK: Properties
    
    private var responceStructure: [NestedPictureModel]?
    private let networkManager = APIClient()
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var pictureTableView: UITableView!
    
    //MARK: LoadView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataRequest()
        setupUI()
        setupTableView()
        
    }
    
    //MARK: Init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBarItem()
    }
    
    //MARK: Networking
    
    private func dataRequest() {
        self.networkManager.fechDataRequestForTableView(completion: setDataToStruct)
    }
    
    private func setDataToStruct(_ models: PictureModel) {
        self.responceStructure = models.responceData
        self.pictureTableView.reloadData()
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        self.title = "Main"
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: "Main",
                                       image: .init(systemName: "list.bullet.rectangle.portrait"),
                                       tag: 0)
    }
    
    private func setupTableView() {
        self.pictureTableView.delegate = self
        self.pictureTableView.dataSource = self
        self.pictureTableView.register(UINib(nibName: "PictureTableViewCell", bundle: nil), forCellReuseIdentifier: PictureTableViewCell.reuseidentifier)
    }
}

//MARK: UITableViewDelegate

extension PictureTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: UITableViewDataSource

extension PictureTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.view.frame.width
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PictureTableViewCell.reuseidentifier, for: indexPath) as? PictureTableViewCell {
            guard let responceStructure = self.responceStructure else { return cell}
            cell.setupCells(with: responceStructure[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
