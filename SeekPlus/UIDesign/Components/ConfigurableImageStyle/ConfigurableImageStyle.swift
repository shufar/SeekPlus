//
//  ConfigurableImageView.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

extension Image {
    func configurableImageStyle(_ imageAttributes: ImageAttributes = ImageAttributes())
    -> some View {
        self
            .renderingMode(imageAttributes.renderingMode)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: imageAttributes.size.width,
                   height: imageAttributes.size.height)
            .foregroundColor(imageAttributes.foregroundColor)
            .symbolEffect(.pulse,
                          options: .repeat(1).speed(1),
                          isActive: imageAttributes.animate)
    }
}

#Preview {
    Image(systemName: "house")
        .configurableImageStyle(ImageAttributes(size: CGSize(width: 48, height: 48),
                                    animate: true))
        .padding()
}
