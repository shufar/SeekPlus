//
//  TabBarView.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

struct TabBarView: View {
    @State var currentSelectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $currentSelectedTab) {
            HomeView()
                .tabItem{
                    VStack(alignment: .center, spacing: .zero) {
                        TabBarItem.home.image
                        TabBarItem.home.title
                    }
                }.tag(TabBarItem.home.tag)
            
            AppliedJobsView()
                .tabItem {
                    VStack(alignment: .center, spacing: .zero) {
                        TabBarItem.applied.image
                        TabBarItem.applied.title
                    }
                }.tag(TabBarItem.applied.tag)
            
            ProfileView()
                .tabItem {
                    VStack(alignment: .center, spacing: .zero) {
                        TabBarItem.profile.image
                        TabBarItem.profile.title
                    }
                }.tag(TabBarItem.profile.tag)
        }.tint(AppColor.backgroundBrand.color)
    }
}

#Preview {
    TabBarView(currentSelectedTab: 2)
}
