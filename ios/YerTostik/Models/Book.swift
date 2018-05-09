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
        guard let path = Bundle.main.path(forResource: "books", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let jsonObject = try JSON(data: data)
            if !jsonObject.isEmpty {
                var books: [Book] = []
                _ = jsonObject.arrayValue.map {
                    let book = Book(name: $0["name"].stringValue, depiction: $0["depiction"].stringValue, category:
                        $0["category"].stringValue, image: $0["image"].stringValue)
                    if book.category == category {
                        books.append(book)
                        print(books)
                    }
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
