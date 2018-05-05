//
//  ProfileViewController.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy

struct ProfileItem {
    let title: String
    let color: UIColor
}

class ProfileViewController: UIViewController {
    
    // MARK: Properties
    
    let prfofileItems = [
        ProfileItem(title: "Алдар Көсе", color: .shamrock),
        ProfileItem(title: "Мақта Қыз", color: .anakiwa),
        ProfileItem(title: "Алпамыс Батыр", color: .melrose),
        ProfileItem(title: "Қобыланды Батыр", color: .monaLisa)
    ]
    
    let itemWidth = UIScreen.main.bounds.width / 2 - 30
    
    lazy var layout: UICollectionViewFlowLayout = {
        return UICollectionViewFlowLayout().then {
            $0.itemSize = CGSize(width: itemWidth, height: itemWidth + 60)
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
            $0.register(cellType: ProfileCollectionViewCell.self)
            $0.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ProfileHeaderView")
            
        }
    }()
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
        configureConstraints()
    }
    
    // MARK: Configure Navigation Bar
    
    func configureNavigationBar() {
        self.navigationItem.title = "Профиль"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "settings"), style: .plain, target: self, action: #selector(settingsButtonDidPress))
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
    
    // MARK: User Interaction
    
    @objc func settingsButtonDidPress() {
        let vc =  SettingsViewController()
        vc.hidesBottomBarWhenPushed = true
        let _ = navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prfofileItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as ProfileCollectionViewCell
        let profileItem = prfofileItems[indexPath.row]
        cell.titleLabel.text = profileItem.title
        cell.heroImageView.backgroundColor = profileItem.color
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ProfileHeaderView", for: indexPath) as! ProfileHeaderView
            return reusableview
        default:  fatalError("Unexpected element kind")
        }
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 110)
    }
}