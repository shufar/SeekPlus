//
//  ConfigurableBackgroundView.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct ConfigurableBackgroundView<Content: View>: View {
    let backgroundAttributes: BackgroundAttributes
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding(Margin.default.value)
            .overlay(
                RoundedRectangle(cornerRadius:
                                    backgroundAttributes.cornerRadius)
                .stroke(backgroundAttributes.borderColor,
                        lineWidth: backgroundAttributes.strokeWidth)
            )
            .background(
                RoundedRectangle(cornerRadius:
                                    backgroundAttributes.cornerRadius)
                .fill(backgroundAttributes.fillColor))
    }
}

extension View {
    func backgroundStyle(_ backgroundAttributes:
                         BackgroundAttributes = BackgroundAttributes())
    -> some View {
        ConfigurableBackgroundView(backgroundAttributes: backgroundAttributes) {
            self
        }
    }
}

#Preview {
    Text("Text with a nice border and background color")
        .textStyle(TextAttributes(color: AppColor.backgroundBrand.color))
        .backgroundStyle(BackgroundAttributes(fillColor:
                                                AppColor.backgroundSecondary.color))
}
