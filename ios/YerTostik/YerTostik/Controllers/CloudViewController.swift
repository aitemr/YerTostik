//
//  CloudViewController.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy

struct CloudItem {
    let title: String
    let color: UIColor
}

class CloudViewController: UIViewController {
    
    // MARK: Properties
    
    let cloudItems = [
        CloudItem(title: "Қазақ халық ертетілері", color: .shamrock),
        CloudItem(title: "Орыс халық ертегілері", color: .anakiwa),
        CloudItem(title: "Шетел ертегілері", color: .melrose),
        CloudItem(title: "Аудио ертегілер", color: .monaLisa),
        CloudItem(title: "Көп оқылган ертегілер", color: .dodgerBlue),
        CloudItem(title: "Жаңадан салынғандар", color: .malibu),
        ]
    
    let itemWidth = UIScreen.main.bounds.width / 2 - 30
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(cellType: CloudCollectionViewCell.self)
        return collectionView
    }()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Желі"
        configureViews()
        configureConstraints()
    }
    
    // MARK: Configure Views
    
    func configureViews(){
        [collectionView].forEach{
            view.addSubview($0)
        }
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints(){
        collectionView.easy.layout(Edges(0))
    }
    
}

extension CloudViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cloudItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as CloudCollectionViewCell
        let cloudItem = cloudItems[indexPath.row]
        cell.titleLabel.text = cloudItem.title
        cell.contentView.backgroundColor = cloudItem.color
        return cell
    }
    
}
