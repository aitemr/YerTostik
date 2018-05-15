//
//  Extensions.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Darwin

extension UIColor {
    static let alabaster = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    static let cornflowerBlue = #colorLiteral(red: 0.4039215686, green: 0.5254901961, blue: 1, alpha: 1)
    static let loblolly = #colorLiteral(red: 0.7333333333, green: 0.7803921569, blue: 0.8117647059, alpha: 1)
    static let pickledBluewood = #colorLiteral(red: 0.1960784314, green: 0.2705882353, blue: 0.3607843137, alpha: 1)
    static let shamrock = #colorLiteral(red: 0.2235294118, green: 0.8039215686, blue: 0.5647058824, alpha: 1)
    static let anakiwa = #colorLiteral(red: 0.5764705882, green: 0.7529411765, blue: 1, alpha: 1)
    static let melrose = #colorLiteral(red: 0.7725490196, green: 0.7294117647, blue: 1, alpha: 1)
    static let monaLisa = #colorLiteral(red: 1, green: 0.5764705882, blue: 0.5764705882, alpha: 1)
    static let dodgerBlue = #colorLiteral(red: 0.2941176471, green: 0.4549019608, blue: 1, alpha: 1)
    static let malibu = #colorLiteral(red: 0.5490196078, green: 0.6509803922, blue: 0.9882352941, alpha: 1)
    static let dustyGray = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
    static let doveGray = #colorLiteral(red: 0.3803921569, green: 0.3803921569, blue: 0.3803921569, alpha: 1)
    static let trout = #colorLiteral(red: 0.3098039216, green: 0.3411764706, blue: 0.4, alpha: 1)
    static let gray = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5568627451, alpha: 1)
    static let goldColor = #colorLiteral(red: 0.9725490196, green: 0.8117647059, blue: 0.1098039216, alpha: 1)
    static let silverColor = #colorLiteral(red: 0.7725490196, green: 0.7725490196, blue: 0.7725490196, alpha: 1)
    static let bronzeColor = #colorLiteral(red: 0.768627451, green: 0.4549019608, blue: 0.2156862745, alpha: 1)
}

extension UIFont {
    static func avenirHeavy(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size)!
    }
    static func avenirBlack(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Black", size: size)!
    }
    static func avenirLight(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size)!
    }
}

extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()! as CGContext
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context.clip(to: rect, mask: self.cgImage!)
        tintColor.setFill()
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

