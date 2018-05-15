//
//  PaddingTextField.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/6/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//


import UIKit

final class PaddingTextField: UITextField {
    
    fileprivate var verticalPadding: CGFloat = 0
    fileprivate var horizontalPadding: CGFloat = 0
    
    convenience init(verticalPadding: CGFloat, horizontalPadding: CGFloat) {
        self.init()
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + horizontalPadding, y: bounds.origin.y + verticalPadding,
                      width: bounds.size.width - horizontalPadding * 2, height: bounds.size.height - verticalPadding * 2)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
    
}
