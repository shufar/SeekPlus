//
//  ConfigurableButtonStyle.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct ConfigurableButtonStyle: ButtonStyle {
    let buttonAttributes: ButtonAttributes

    init(_ buttonAttributes: ButtonAttributes = ButtonAttributes()) {
        self.buttonAttributes = buttonAttributes
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(TextAttributes(style: .title,
                                      weight: .bold,
                                      color: buttonAttributes.color))
            .padding(Margin.large.value)
            .background(buttonAttributes.backgroundColor)
            .cornerRadius(buttonAttributes.cornerRadius)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    Button(action: {}, label: {
        HStack {
            Image(systemName: "house")
                .configurableImageStyle(
                    ImageAttributes(foregroundColor: AppColor.white.color,
                                    size: CGSize(width: ImageSize.large.value,
                                                 height: ImageSize.large.value)))
            Text("Button")
        }
    })
    .buttonStyle(ConfigurableButtonStyle())
    .padding()
}
