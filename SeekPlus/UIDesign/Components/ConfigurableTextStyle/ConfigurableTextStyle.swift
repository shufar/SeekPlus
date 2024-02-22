//
//  ConfigurableTextStyle.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

struct ConfigurableTextStyle: ViewModifier {
    let textAttributes: TextAttributes
    
    func body(content: Content) -> some View {
        content
            .font(textAttributes.style)
            .fontWeight(textAttributes.weight)
            .foregroundColor(textAttributes.color)
            .lineLimit(textAttributes.lineLimit)
    }
}

extension View {
    func textStyle(_ textAttributes: TextAttributes = TextAttributes())
    -> some View {
        modifier(ConfigurableTextStyle(textAttributes: textAttributes))
    }
}
#Preview {
    VStack {
        Text("This is a very long long long long long text that might span multiple lines")
            .textStyle()
            .padding()
        
        Text("This is a very long long long long long text that might span multiple lines in RED and BOLD")
            .textStyle(TextAttributes(weight: .bold,
                                      color: .red,
                                      lineLimit: nil))
            .padding()
    }
}
