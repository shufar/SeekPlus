//
//  TabBarView.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI
import Swinject

struct TabBarView: View {
    @State var currentSelectedTab: Int = 1

    private let assembly: Assembler = Assembler([HomeAssembly(),
                                                 AppliedJobsAssembly()],
                                                container: AppDelegate.baseContainer)

    var body: some View {
        TabView(selection: $currentSelectedTab) {
            HomeView(
                homeViewModel:
                    self.assembly.resolver.resolve(HomeViewModelContract.self)!)
            .tabItem {
                VStack(alignment: .center, spacing: .zero) {
                    TabBarItem.home.image
                    TabBarItem.home.title
                }
            }.tag(TabBarItem.home.tag)

            AppliedJobsView(
                appliedJobsViewModel:
                    self.assembly.resolver.resolve((any AppliedJobsViewModelContract).self)!)
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
        }
        .tint(AppColor.backgroundBrand.color)
        .toolbar(.hidden)
//        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView(currentSelectedTab: 2)
}
