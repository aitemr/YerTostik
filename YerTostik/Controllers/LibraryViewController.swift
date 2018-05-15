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
import FolioReaderKit

class LibraryViewController: UIViewController {
    
    // MARK: Properties
    
    var books: [Book] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var localBookNames: [String] = []
    
    lazy var tableView: UITableView = {
        return UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: LibraryTableViewCell.self)
            $0.emptyDataSetSource = self as DZNEmptyDataSetSource
            $0.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
            $0.rowHeight = 180
            $0.tableFooterView = UIView(frame: CGRect.zero)
        }
    }()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Сөре"
        configureViews()
        configureConstraints()
        loadFakeBooks()
    }
    
    // MARK: Configure Views
    
    func configureViews(){
        self.view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints(){
        tableView.easy.layout(Edges(0))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: Load data
    
    func loadData() {
        Favorite.fetchLocalBooks{ [unowned self] (results, error) in
            self.localBookNames = []
            guard error == nil, let results = results else { return }
            results.forEach{
                if $0.isFavorited {
                    self.localBookNames.append($0.name)
                }
            }
            Book.fetchBy(names: self.localBookNames, completion: { [unowned self] (results, error) in
                if error == nil {
                    guard let results = results else { return }
                    self.books = results
                }
            })
        }
    }
    
    func loadFakeBooks() {
        let names = ["Мақта қыз", "Ер Төстік", "Алдаркөсе"]
        for name in names {
            Favorite.addBookBy(name: name) { [unowned self] (error) in
                if error == nil { print(name) }
            }
        }
        
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate

extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as LibraryTableViewCell
        let book = books[indexPath.row]
        cell.titleLabel.text = book.name
        cell.subTitleLabel.text = book.category
        cell.descriptionLabel.text = book.depiction
        cell.coverImageView.image = UIImage(named: book.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let book = books[indexPath.row]
        if (book.category == Category.ar.rawValue) {
            let vc = DetailedBookViewController()
            vc.book = book
            vc.hidesBottomBarWhenPushed = true
            let _ = navigationController?.pushViewController(vc, animated: true)
        } else {
            let config = FolioReaderConfig()
            let folioReader = FolioReader()
            config.shouldHideNavigationOnTap = false
            if let bookPath = Bundle.main.path(forResource: book.name, ofType: "epub") {
                folioReader.presentReader(parentViewController: self, withEpubPath: bookPath, andConfig: config)
            }
        }
    }
}

// MARK: DZNEmptyDataSet

extension LibraryViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = "Кітапты сөре бөлімінен жаза аласыз"
        let attribute = [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
        let attributedString = NSAttributedString(string: title, attributes: attribute)
        return attributedString
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = "Ештене табылмады"
        let attribute = [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
        let attributedString = NSAttributedString(string: title, attributes: attribute)
        return attributedString
    }
}

