//
//  SignUpViewController.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/5/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit

class PhoneNumberViewController: UIViewController {

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
        self.navigationItem.title = "Телефон номер"
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .pickledBluewood
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Келесi", style: .plain, target: self, action: #selector(nextButtonDidPress(_:)))
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.view.backgroundColor = .alabaster
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
    }
    
    // MARK: User Interaction
    
    @objc fileprivate func nextButtonDidPress(_ sender: UIButton) {
    }

}
