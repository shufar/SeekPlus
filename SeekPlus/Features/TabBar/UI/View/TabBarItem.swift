//
//  TabBarItem.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

enum TabBarItem: String {
    case home = "Home"
    case applied = "Applied"
    case profile = "Profile"
    
    var image: some View {
        switch self {
        case .home:
            Image(systemName: "house")
                .configurableImageStyle()
        case .applied:
            Image(systemName: "pencil.and.list.clipboard")
                .configurableImageStyle()
        case .profile:
            Image(systemName: "person")
                .configurableImageStyle()
        }
    }
    
    var title: some View {
        Text(self.rawValue)
    }
    
    var tag: Int {
        switch self {
        case .home: 1
        case .applied: 2
        case .profile: 3
        }
    }
}
