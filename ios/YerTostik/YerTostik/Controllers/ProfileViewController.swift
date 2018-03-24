//
//  ProfileViewController.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileBoardViewController: UIViewController {
    
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
    
    func configureViews() {
        self.view.backgroundColor = .white
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints() {
    }
    
    // MARK: User Interaction
    
    @objc func settingsButtonDidPress() {
        let vc =  SettingsViewController()
        vc.hidesBottomBarWhenPushed = true
        let _ = navigationController?.pushViewController(vc, animated: true)
    }
    
}
