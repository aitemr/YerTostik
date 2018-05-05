//
//  SettingsViewController.swift
//  YerTostik
//
//  Created by Islam on 25.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy

struct SettingsItem {
    var image: UIImage?
    var title: String?
}

class SettingsViewController: UIViewController {
    
    // MARK: Properties
    
    let sectionItems = [
        [SettingsItem(image: #imageLiteral(resourceName: "rate"), title: "App Store - да рейтинг қою"),
         SettingsItem(image: #imageLiteral(resourceName: "feedback"), title: "Байланыс"),
         SettingsItem(image: #imageLiteral(resourceName: "aboutus"), title: "Біз туралы")],
        [SettingsItem(image: #imageLiteral(resourceName: "instagram"), title: "Instagram"),
         SettingsItem(image: #imageLiteral(resourceName: "facebook"), title: "Facebook"),
         SettingsItem(image: #imageLiteral(resourceName: "vk"), title: "VK")
        ]
    ]
    
    lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .grouped).then {
            $0.delegate = self
            $0.dataSource = self
            $0.isScrollEnabled = false
            $0.rowHeight = 46
            $0.register(cellType: SettingsTableViewCell.self)
        }
    }()
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configreViews()
        configureConstraints()
    }
    
    // MARK: Configure Navigation Bar
    
    func configureNavigationBar() {
        self.navigationItem.title = "Баптаулар"
    }
    
    // MARK: Configure Views
    
    func configreViews() {
        view.addSubview(tableView)
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints() {
        tableView.easy.layout(Edges(0))
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate, 

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionItems[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as SettingsTableViewCell
        let section = sectionItems[indexPath.section][indexPath.row]
        cell.titleLabel.text = section.title
        cell.cellIcon.image = section.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Достармен бөлісу"
        }
        return "Қосымша туралы"
    }
}
