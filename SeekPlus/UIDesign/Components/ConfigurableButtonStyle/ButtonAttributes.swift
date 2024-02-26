//
//  ButtonAttributes.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct ButtonAttributes {
    let color: Color
    let backgroundColor: Color
    let cornerRadius: CGFloat

    init(color: Color = AppColor.white.color,
         backgroundColor: Color = AppColor.buttonPrimary.color,
         cornerRadius: CGFloat = 8) {
        self.color = color
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
}

extension ButtonAttributes {
    static var defaultButton: ButtonAttributes {
        self.init()
    }

    static var secondaryButton: ButtonAttributes {
        self.init(backgroundColor: AppColor.buttonSecondry.color)
    }

    static var tertiaryButton: ButtonAttributes {
        self.init(color: AppColor.textSecondary.color,
                  backgroundColor: AppColor.white.color)
    }

    static var logoutButton: ButtonAttributes {
        self.init(color: AppColor.backgroundBrand.color,
        backgroundColor: AppColor.white.color)
    }
}
