//
//  TabBarController.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Sugar

struct TabBarItem {
    var icon: (UIImage?, UIImage?)
    var controller: UIViewController
}

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarItems = [
            TabBarItem(icon: (#imageLiteral(resourceName: "library"), #imageLiteral(resourceName: "librarySelected")), controller: LibraryViewController()),
            TabBarItem(icon: (#imageLiteral(resourceName: "headphones"), #imageLiteral(resourceName: "headphonesSelected")), controller: AudioViewController()),
            TabBarItem(icon: (#imageLiteral(resourceName: "cloud"), #imageLiteral(resourceName: "cloudSelected")), controller: CloudViewController()),
            TabBarItem(icon: (#imageLiteral(resourceName: "leaderboard"), #imageLiteral(resourceName: "leaderboardSelected")), controller: LeaderBoardViewController()),
            TabBarItem(icon: (#imageLiteral(resourceName: "profile"), #imageLiteral(resourceName: "profileSelected")), controller: SettingsViewController()),
            ]
        
        viewControllers = tabBarItems.compactMap {
            UINavigationController(rootViewController: $0.controller).then {
                $0.navigationBar.tintColor = .pickledBluewood
                $0.navigationBar.barTintColor = .alabaster
                $0.navigationBar.prefersLargeTitles = true
                $0.navigationBar.largeTitleTextAttributes =
                    [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
                $0.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
            }
        }
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.tintColor = .cornflowerBlue
        
        for (index, item) in tabBarItems.enumerated() {
            setUpTabBarItem(tabBar.items![index],
                            image: item.icon.0,
                            selectedImage: item.icon.1)
        }
        
        guard let items = self.tabBar.items else { return }
        for item in items as [UITabBarItem] {
            if let image = item.image {
                item.image = image.imageWithColor(tintColor: .loblolly).withRenderingMode(.alwaysOriginal)
            }
        }
    }
    
    // MARK: Setup
    
    fileprivate func setUpTabBarItem(_ tabBarItem: UITabBarItem?,
                                     image: UIImage?,
                                     selectedImage: UIImage?) {
        tabBarItem?.image = image
        tabBarItem?.selectedImage = selectedImage
        tabBarItem?.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
    }
}




