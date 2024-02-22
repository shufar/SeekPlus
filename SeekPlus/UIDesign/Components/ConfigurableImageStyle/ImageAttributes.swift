//
//  ImageStyle.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

struct ImageAttributes {
    let renderingMode: Image.TemplateRenderingMode
    let foregroundColor: Color
    let size: CGSize
    let animate: Bool
    
    init(renderingMode: Image.TemplateRenderingMode = .template,
         foregroundColor: Color = AppColor.backgroundBrand.color,
         size: CGSize = CGSize(width: 8, height: 8),
         animate: Bool = false) {
        self.renderingMode = renderingMode
        self.foregroundColor = foregroundColor
        self.size = size
        self.animate = animate
    }
}
