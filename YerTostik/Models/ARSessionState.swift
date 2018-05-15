//
//  ARSessionState.swift
//  YerTostik
//
//  Created by Islam on 01.04.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import Foundation

enum ARSessionState: String, CustomStringConvertible {
    case initialized = "initialized"
    case ready = "ready"
    case temporarilyUnavailable = "temporarily unavailable"
    case failed = "failed"
    
    var description: String {
        switch self {
        case .initialized:
            return "Look for a plane to place your Hero"
        case .ready:
            return "Click any plane to place your Hero!"
        case .temporarilyUnavailable:
            return "Please wait"
        case .failed:
            return "Please restart App."
        }
    }
}
