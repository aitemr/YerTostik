//
//  Library.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy
import DZNEmptyDataSet

struct Book {
    var name: String?
    var description: String?
    var image: UIImage?
    var category: String?
    var progress: Int?
}

class LibraryViewController: UIViewController {
    
    // MARK: Properties
    
    lazy var tableView: UITableView = {
        return UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: LibraryTableViewCell.self)
            $0.emptyDataSetSource = self as DZNEmptyDataSetSource
            $0.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
            $0.rowHeight = 180
        }
    }()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Сөре"
        configureViews()
        configureConstraints()
    }
    
    // MARK: Configure Views
    
    func configureViews(){
        self.view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints(){
        tableView.easy.layout(Edges(0))
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate

extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as LibraryTableViewCell
        return cell
    }
}

// MARK: DZNEmptyDataSet

extension LibraryViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = "Ештене табылмады"
        let attribute = [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
        let attributedString = NSAttributedString(string: title, attributes: attribute)
        return attributedString
    }
}

