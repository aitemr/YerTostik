//
//  LeaderBoardViewController.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy
import DZNEmptyDataSet

struct LeaderBoardItem {
    var image: UIImage?
    var name: String?
    var score: String?
}

class LeaderBoardViewController: UIViewController {
    
    // MARK: Properties
    
    lazy var tableView: UITableView = {
        return UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: LeaderBoardTableViewCell.self)
            $0.rowHeight = 65
            $0.emptyDataSetSource = self as DZNEmptyDataSetSource
            $0.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
            $0.tableHeaderView = self.headerView
            $0.allowsSelection = false
        }
    }()
    
    lazy var headerView: LeaderBoardHeaderView = {
        return LeaderBoardHeaderView(frame: CGRect(x: 0, y: 0,
                                                   width: UIScreen.main.bounds.width,
                                                   height: 140))
    }()
    
    let leaderBoardItems = [
        LeaderBoardItem(image: #imageLiteral(resourceName: "alisher"), name: "Алишер Базарханов", score: "22"),
        LeaderBoardItem(image: #imageLiteral(resourceName: "nazerke"), name: "Назерке Шалданбаева", score: "19"),
        LeaderBoardItem(image: #imageLiteral(resourceName: "alina"), name: "Алина Бошаева", score: "18"),
        LeaderBoardItem(image: #imageLiteral(resourceName: "danel"), name: "Мукан Данель", score: "15"),
        LeaderBoardItem(image: #imageLiteral(resourceName: "sanat"), name: "Абеу Санат", score: "12"),
        LeaderBoardItem(image: #imageLiteral(resourceName: "dauren"), name: "Аргинбаев Санжар", score: "9"),
        LeaderBoardItem(image: #imageLiteral(resourceName: "alina"), name: "Алина Бошаева", score: "7")
    ]
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Үздік оқырмандар"
        configureViews()
        configureConstraints()
    }
    
    // MARK: Configure Views
    
    func configureViews(){
        self.view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints(){
        tableView.easy.layout(Edges(0))
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate

extension LeaderBoardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderBoardItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as LeaderBoardTableViewCell
        let item = leaderBoardItems[indexPath.row]
        cell.placeLabel.text = "\(indexPath.row + 4)"
        cell.avatarImageView.image = item.image
        cell.nameLabel.text = item.name
        cell.scoreLabel.text = item.score
        return cell
    }
}

// MARK: DZNEmptyDataSet

extension LeaderBoardViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = "Ештене жоқ"
        let attribute = [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
        let attributedString = NSAttributedString(string: title, attributes: attribute)
        return attributedString
    }
}
