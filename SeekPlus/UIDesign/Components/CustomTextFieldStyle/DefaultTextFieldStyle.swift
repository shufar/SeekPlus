//
//  SelectedTextFieldStyle.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

struct DefaultTextFieldStyle: TextFieldStyle {
    var isEditing: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .textStyle(TextAttributes(style: .title2))
            .padding(Margin.default.value)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isEditing
                            ? AppColor.textFieldBorder.color
                            : AppColor.textPrimary.color,
                            lineWidth: isEditing ? 6 : 2)
            )
    }
}

/// Implementation for demo and preview
struct CustomTextField: View {
    @State private var inputText: String = ""
    @State private var isEditing: Bool = false

    var body: some View {
        TextField("Placeholder text", text: $inputText,
                  onEditingChanged: { isEditing = $0 })
            .textFieldStyle(DefaultTextFieldStyle(isEditing: isEditing))
            .padding()
    }
}

#Preview {
    CustomTextField()
}
