//
//  Book.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/9/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import Foundation
import SwiftyJSON

class Book: NSObject {
    var name: String
    var depiction: String
    var category: String
    var image: String
    
    init(name: String, depiction: String, category: String, image: String) {
        self.name = name
        self.depiction = depiction
        self.category = category
        self.image = image
    }
    
    static func fetchBy(category: String, completion: @escaping (([Book]?, String?) -> Void)) {
        Book.fetch { (results, error) in
            var books: [Book] = []
            if error == nil {
                guard let results = results else { return }
                for result in results {
                    if (result.category == category) {
                        books.append(result)
                    }
                }
                completion(books, nil)
            } else {
                completion(books, "Empty")
            }
        }
    }
    
    static func fetchBy(names: [String]?, completion: @escaping (([Book]?, String?) -> Void)) {
        Book.fetch { (results, error) in
            if error == nil {
                var books: [Book] = []
                if let results = results {
                    guard let names = names else { return }
                    for result in results {
                        _ = names.map {
                            if ($0 == result.name) {
                                books.append(result)
                            }
                        }
                    }
                    completion(books, nil)
                } else {
                    completion(nil, "error")
                }
            }
        }
    }
    
    static func fetch(completion: @escaping (([Book]?, String?) -> Void)) {
        guard let path = Bundle.main.path(forResource: "books", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let jsonObject = try JSON(data: data)
            if !jsonObject.isEmpty {
                var books: [Book] = []
                _ = jsonObject.arrayValue.map {
                    let book = Book(name: $0["name"].stringValue, depiction: $0["depiction"].stringValue, category:
                        $0["category"].stringValue, image: $0["image"].stringValue)
                    books.append(book)
                    completion(books, nil)
                }
            } else {
                completion(nil, "empty json object")
            }
        } catch let error {
            completion(nil, error.localizedDescription)
        }
    }
    
}
