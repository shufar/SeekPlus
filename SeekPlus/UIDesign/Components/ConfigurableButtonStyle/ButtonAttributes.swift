//
//  ButtonAttributes.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

struct ButtonAttributes {
    let titleColor: Color
    let backgroundColor: Color
    let cornerRadius: CGFloat
    
    init(titleColor: Color = AppColor.white.color,
         backgroundColor: Color = AppColor.buttonPrimary.color,
         cornerRadius: CGFloat = 8) {
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
}
