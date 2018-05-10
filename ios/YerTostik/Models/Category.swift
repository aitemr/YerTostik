//
//  Category.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/9/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import Foundation

enum Category: String {
    case ar = "Ғажайып ертегілер"
    case kazakh = "Қазақ халық ертегілері"
    case russian = "Орыс халық ертегілері"
    case international = "Шетел ертегілері"
    case popular = "Көп оқылган ертегілер"
    case new = "Жаңадан салынғандар"
    
    static var all: [Category] {
        return [.ar, .kazakh, .russian, .international,.popular, .new]
    }
}
