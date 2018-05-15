//
//  Favorite.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/10/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import Foundation
import RealmSwift

class Favorite: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var isFavorited = false
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    static func fetchLocalBooks(completion: @escaping (([Favorite]?, String?) -> Void)) {
        do {
            var results: [Favorite] = []
            let realm = try Realm()
            let favorites = realm.objects(Favorite.self)
            for favorite in favorites {
                results.append(favorite)
            }
            completion(results, nil)
        } catch let error {
            completion(nil, error.localizedDescription)
        }
    }
    
    static func addBookBy(name: String?, completion: @escaping (String?) -> Void) {
        guard let name = name else { return }
        do {
            let realm = try Realm()
            try realm.write {
                let favorite = Favorite()
                favorite.name = name
                favorite.isFavorited = true
                realm.add(favorite, update: true)
            }
            completion(nil)
        } catch let error {
            completion(error.localizedDescription)
        }
    }
    
    static func removeBookBy(name: String?, completion: @escaping (String?) -> Void) {
        guard let name = name else { return }
        do {
            let realm = try Realm()
            try realm.write {
                let favorite = realm.objects(Favorite.self).filter("name = '\(name)'")
                realm.delete(favorite)
            }
            completion(nil)
        } catch let error {
            completion(error.localizedDescription)
        }
    }
    
    static func isBookSaved(name: String?) -> Bool {
        guard let name = name else { return false }
        do {
            let realm = try Realm()
            let favorite = realm.objects(Favorite.self).filter("name = '\(name)'")
            return favorite.count > 0 ? true : false
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
}
