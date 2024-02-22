//
//  ConfigurableButtonStyle.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
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
                                      color: buttonAttributes.titleColor))
            .padding(Margin.large.value)
            .background(buttonAttributes.backgroundColor)
            .cornerRadius(buttonAttributes.cornerRadius)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
        Text("Button")
    })
    .buttonStyle(ConfigurableButtonStyle())
    .padding()
}
