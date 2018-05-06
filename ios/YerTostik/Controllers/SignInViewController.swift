//
//  LoginViewController.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/5/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: Properties
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
        configureConstriants()
    }
    
    //MARK: - Setup Navbar
    
    func configureNavigationBar() {
        self.navigationItem.title = "Кiру"
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .pickledBluewood
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = false
        
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.view.backgroundColor = .white
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
    }

    // MARK: User Interaction
    
    @objc fileprivate func signInButtonDidPress(_ sender: UIButton) {
    }
    
}
