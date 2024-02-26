//
//  TextFieldAttributes.swift
//  SeekPlus
//
//  Created by Shubham
//

import Foundation
import SwiftUI

struct TextFieldAttributes {
    let textAtteibutes: TextAttributes
    let cornerRadius: CGFloat
    let normalBorderColor: Color
    let editingBorderColor: Color
    let normalBorderWidth: CGFloat
    let editingBorderWidth: CGFloat
}

extension TextFieldAttributes {
    static var `default`: TextFieldAttributes {
        self.init(textAtteibutes: TextAttributes(style: .title2),
                  cornerRadius: CornerRadius._8.value,
                  normalBorderColor: AppColor.textPrimary.color,
                  editingBorderColor: AppColor.textFieldBorder.color,
                  normalBorderWidth: 2,
                  editingBorderWidth: 6)
    }

    static var searchBar: TextFieldAttributes {
        self.init(textAtteibutes: TextAttributes(style: .headline),
                  cornerRadius: .zero,
                  normalBorderColor: AppColor.backgroundBrand.color,
                  editingBorderColor: AppColor.buttonPrimary.color.opacity(0.9),
                  normalBorderWidth: 4,
                  editingBorderWidth: 4)
    }
}
