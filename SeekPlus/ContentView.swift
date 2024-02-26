//
//  ContentView.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LoginView(loginViewModel:
                        AppDelegate.baseAssebler.resolver.resolve((any LoginViewModelContract).self)!)
//            TabBarView()
        }
    }
}

#Preview {
    ContentView()
}
