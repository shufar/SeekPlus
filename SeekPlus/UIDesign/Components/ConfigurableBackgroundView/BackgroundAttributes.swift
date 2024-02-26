//
//  BackgroundViewAttributes.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct BackgroundAttributes {
    let borderColor: Color
    let fillColor: Color
    let strokeWidth: CGFloat
    let cornerRadius: CGFloat

    init(borderColor: Color = AppColor.textFieldBorder.color,
         fillColor: Color = AppColor.white.color,
         strokeWidth: CGFloat = 1,
         cornerRadius: CGFloat = CornerRadius._8.rawValue) {
        self.borderColor = borderColor
        self.fillColor = fillColor
        self.strokeWidth = strokeWidth
        self.cornerRadius = cornerRadius
    }
}
