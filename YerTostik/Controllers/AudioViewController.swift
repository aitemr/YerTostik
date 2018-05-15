//
//  AudioViewController.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/14/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit

class AudioViewController: UIViewController {

    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
    }
    
    //MARK: - Configure Navbar
    
    func configureNavigationBar() {
        self.navigationItem.title = "Аудио"
    }
    
    
    // MARK: Configure Views
    
    func configureViews(){
        self.view.backgroundColor = .white
    }
  
}
