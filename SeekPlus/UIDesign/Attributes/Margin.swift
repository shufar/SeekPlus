//
//  Margin.swift
//  SeekPlus
//
//  Created by Shubham
//

import Foundation

enum Margin: CGFloat {
    case `default` = 8
    case zero = 0
    case half = 4
    case large = 16
    case xLarge = 24
    case xxLarge = 32
    case xxxLarge = 48

    var value: CGFloat {
        self.rawValue
    }
}
