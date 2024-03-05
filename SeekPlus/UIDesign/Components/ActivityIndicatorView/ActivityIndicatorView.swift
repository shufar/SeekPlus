//
//  ActivityIndicatorView.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct ActivityIndicatorView: ViewModifier {
    private var isLoading: Bool

    init(_ isLoading: Bool) {
        self.isLoading = isLoading
    }

    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content

            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(AppColor.buttonPrimary.color)
                    .scaleEffect(2.5, anchor: .center)
            }
        }
    }
}

extension View {
    func activityIndicator(_ isLoading: Bool) -> some View {
        modifier(ActivityIndicatorView(isLoading))
    }
}

struct ActivityIndicator_Preview: View {
    @State private var isLoading = true

    var body: some View {
        VStack {
            Text("This is a demo of an activity indicator")
                .padding()
                .activityIndicator(isLoading)
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                debugPrint("Hiding Indicator")
                isLoading = false
            }
        })
    }
}

#Preview {
    ActivityIndicator_Preview()
}
