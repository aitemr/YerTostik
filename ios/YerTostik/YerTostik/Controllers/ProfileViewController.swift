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
        self.view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
    }
    
    // MARK: Configure Navigation Bar
    
    func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "settings"), style: .plain, target: self, action: #selector(settingsButtonDidPress))
    }
    
    // MARK: Configure Views
    
    func configureViews() {

    }
    
    // MARK: Configure Constraints
    
    func configureConstraints() {
    }
    
    // MARK: User Interaction
    
    @objc func settingsButtonDidPress() {
        
    }
    
}
