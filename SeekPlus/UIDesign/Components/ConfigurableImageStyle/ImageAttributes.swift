//
//  ImageStyle.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct ImageAttributes {
    let renderingMode: Image.TemplateRenderingMode
    let foregroundColor: Color
    let size: CGSize
    let animate: Bool

    init(renderingMode: Image.TemplateRenderingMode = .template,
         foregroundColor: Color = AppColor.backgroundBrand.color,
         size: CGSize = CGSize(width: ImageSize.small.value,
                               height: ImageSize.small.value),
         animate: Bool = false) {
        self.renderingMode = renderingMode
        self.foregroundColor = foregroundColor
        self.size = size
        self.animate = animate
    }
}

extension ImageAttributes {
    static var large: ImageAttributes {
        self.init(size: CGSize(width: ImageSize.xxLarge.value,
                               height: ImageSize.xxLarge.value))
    }
}
