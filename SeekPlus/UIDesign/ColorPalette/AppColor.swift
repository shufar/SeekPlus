//
//  AppColor.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

enum AppColor: UInt {
    case black = 0x000000
    case white = 0xFFFFFF
    case critical = 0xDC4E50
    case positive = 0x4EAC5B
    case backgroundBrand = 0x0D3880
    case backgroundSecondary = 0xEFF3FB
    case textPrimary = 0x333A49
    case textSecondary = 0x69768C
    case buttonSecondry = 0x2765CF
    case buttonPrimary = 0xE83484
    case textFieldBorder = 0x9EA3E7 // 0xBFC7F4
}

extension AppColor {
    var color: Color {
        Color(hex: self.rawValue)
    }
}


extension Color {
    /// Initializes the Color from  the hex value
    /// - Parameters:
    ///   - hex: Hex value
    ///   - alpha: Opacity value
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
