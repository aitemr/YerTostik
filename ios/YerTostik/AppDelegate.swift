//
//  AppDelegate.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        window = UIWindow(frame: UIScreen.main.bounds).then {
            $0.backgroundColor = .white
        }
//        coordinateAppFlow()
        loadMainPages()
        return true
    }
}

extension AppDelegate {
    
    fileprivate func coordinateAppFlow() {
        if ((Auth.auth().currentUser) != nil) {
            loadMainPages()
        } else {
            loadLoginPages()
        }
    }
    
    func loadMainPages() {
        let mainTabBarController = TabBarController()
        window?.rootViewController = mainTabBarController
        window?.makeKeyAndVisible()
    }
    
    func loadLoginPages() {
        window?.rootViewController = UINavigationController(rootViewController: WelcomeViewController())
        window?.makeKeyAndVisible()
    }
}

