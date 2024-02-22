//
//  TextAttributes.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

struct TextAttributes {
    let style: Font
    let weight: Font.Weight
    let color: Color
    let lineLimit: Int?
    
    init(style: Font = .title,
         weight: Font.Weight = .regular,
         color: Color = AppColor.textPrimary.color,
         lineLimit: Int? = 2) {
        self.style = style
        self.weight = weight
        self.color = color
        self.lineLimit = lineLimit
    }
}
