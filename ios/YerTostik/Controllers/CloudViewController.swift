//
//  CloudViewController.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy

struct CloudBook {
    let title: String
    let color: UIColor
    let category: Category
}

class CloudViewController: UIViewController {
    
    // MARK: Properties
    
    let cloudItems = [
        CloudBook(title: Category.ar.rawValue, color: .shamrock, category: .ar),
        CloudBook(title: Category.kazakh.rawValue, color: .anakiwa, category: .kazakh),
        CloudBook(title: Category.russian.rawValue, color: .melrose, category: .russian),
        CloudBook(title: Category.international.rawValue, color: .monaLisa, category: .international),
        CloudBook(title: Category.popular.rawValue, color: .dodgerBlue, category: .popular),
        CloudBook(title: Category.new.rawValue, color: .malibu, category: .new),
        ]
    
    let itemWidth = Constant.width / 2 - 30
    
    lazy var layout: UICollectionViewFlowLayout = {
        return UICollectionViewFlowLayout().then{
            $0.itemSize = CGSize(width: itemWidth, height: itemWidth)
            $0.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
            $0.minimumLineSpacing = 10
            $0.minimumInteritemSpacing = 0
        }
    }()
    
    lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: .zero, collectionViewLayout: self.layout).then {
            $0.dataSource = self
            $0.delegate = self
            $0.backgroundColor = .white
            $0.register(cellType: CloudCollectionViewCell.self)
        }
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
        view.addSubview(collectionView)
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints(){
        collectionView.easy.layout(Edges(0))
    }
    
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegate

extension CloudViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CloudBookListViewController()
        let cloudItem = cloudItems[indexPath.row]
        vc.category = cloudItem.category
        vc.hidesBottomBarWhenPushed = true
        let _ = navigationController?.pushViewController(vc, animated: true)
    }
}
