//
//  LeaderBoardViewController.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy

class LeaderBoardViewController: UIViewController {
    
    // MARK: Properties
    
    lazy var tableView: UITableView = {
        return UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: LeaderBoardTableViewCell.self)
            $0.rowHeight = 65
//            $0.tableHeaderView = self.headerView
        }
    }()
    
    lazy var headerView: LeaderBoardHeaderView = {
        return LeaderBoardHeaderView(frame: CGRect(x: 0, y: 0,
                                                            width: UIScreen.main.bounds.width,
                                                            height: 150))
    }()
    
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
        [tableView].forEach{
            view.addSubview($0)
        }
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints(){
        tableView.easy.layout(Edges(0))
    }
}

extension LeaderBoardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as LeaderBoardTableViewCell
        return cell
    }
    
}
