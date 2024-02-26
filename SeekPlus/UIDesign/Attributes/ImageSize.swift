//
//  ImageSize.swift
//  SeekPlus
//
//  Created by Shubham
//

import Foundation

enum ImageSize: CGFloat {
    case small = 8
    case `default` = 16
    case large = 24
    case xLarge = 32
    case xxLarge = 48

    var value: CGFloat {
        self.rawValue
    }
}
