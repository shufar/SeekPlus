//
//  SelectedTextFieldStyle.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct DefaultTextFieldStyle: TextFieldStyle {
    var isEditing: Bool
    var attributes: TextFieldAttributes

    init(isEditing: Bool, _ attributes: TextFieldAttributes = .default) {
        self.isEditing = isEditing
        self.attributes = attributes
    }

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .textStyle(attributes.textAtteibutes)
            .padding(Margin.default.value)
            .overlay(
                RoundedRectangle(cornerRadius: attributes.cornerRadius)
                    .stroke(isEditing
                            ? attributes.editingBorderColor
                            : attributes.normalBorderColor,
                            lineWidth: isEditing
                            ? attributes.editingBorderWidth
                            : attributes.normalBorderWidth)
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
