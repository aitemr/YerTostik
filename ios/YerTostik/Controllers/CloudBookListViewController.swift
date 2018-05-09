//
//  CloudBookListViewController.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/9/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy
import DZNEmptyDataSet

class CloudBookListViewController: UIViewController {
    
    // MARK: Properties
    
    var category: Category?
    
    var books: [Book] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        return UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: CloudBookListTableViewCell.self)
            $0.emptyDataSetSource = self as DZNEmptyDataSetSource
            $0.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
            $0.rowHeight = 180
            $0.tableFooterView = UIView(frame: CGRect.zero)
        }
    }()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
        configureConstraints()
        loadBooks()
    }
    
    // MARK: Configure Navigation Bar
    
    func configureNavigationBar() {
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        guard let category = category else { return }
        self.navigationItem.title = category.rawValue
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: Load Data
    
    func loadBooks() {
        guard let category = category else { return }
        Book.fetchBy(category: category.rawValue) { [unowned self] (result, error) in
            if error == nil {
                guard let result = result else { return }
                self.books = result
            }
        }
    }
    
}

// MARK: UITableViewDataSource, UITableViewDelegate

extension CloudBookListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as CloudBookListTableViewCell
        let book = books[indexPath.row]
        cell.titleLabel.text = book.name
        cell.subTitleLabel.text = book.category
        cell.descriptionLabel.text = book.depiction
        cell.coverImageView.image = UIImage(named: book.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

// MARK: DZNEmptyDataSet

extension CloudBookListViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
   
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = "Ештене табылмады"
        let attribute = [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
        let attributedString = NSAttributedString(string: title, attributes: attribute)
        return attributedString
    }
    
}
