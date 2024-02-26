//
//  ProfileView.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        contentView
    }
}

private extension ProfileView {
    var contentView: some View {
        VStack(alignment: .center, spacing: Margin.zero.value) {
            headerView
            Spacer().frame(height: Margin.large.value)
            profileOptionListView
            Spacer()
            logoutButtonView
            Spacer().frame(maxHeight: Margin.large.value)
        }
        .background(AppColor.backgroundSecondary.color)
    }

    var headerView: some View {
        HStack(alignment: .center, spacing: Margin.zero.value) {
            Image(systemName: "person.crop.circle")
                .configurableImageStyle(
                    ImageAttributes(foregroundColor: AppColor.white.color,
                                    size: CGSize(width: ImageSize.xxLarge.value,
                                                 height: ImageSize.xxLarge.value),
                                    animate: true))
                .padding(Margin.half.value)

            Spacer()

            Text("John Appleseed")
                .textStyle(TextAttributes(weight: .bold,
                                          color: AppColor.white.color))

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(AppColor.backgroundBrand.color)
    }

    var profileOptionListView: some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            List {
                Group {
                    profileOptionView("Personal Details")
                    profileOptionView("Profile Visibility")
                    profileOptionView("Notifications")
                    profileOptionView("Delete Account")
                    profileOptionView("Privacy")
                }
                .listRowSeparator(.hidden)
                .listRowSpacing(Margin.large.value)
                .listRowBackground(AppColor.backgroundSecondary.color)
            }
            .listStyle(.plain)
        }.padding()
    }

    func profileOptionView(_ title: String) -> some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            Text(title)
                .textStyle(TextAttributes(style: .title2))
        }
        .frame(maxWidth: .infinity)
        .backgroundStyle()
    }

    var logoutButtonView: some View {
        VStack(alignment: .center, spacing: Margin.zero.value) {
            Button {
                logouAndNavigateToLogin()
            } label: {
                Text("Logout")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(ConfigurableButtonStyle(ButtonAttributes.logoutButton))
            .backgroundStyle()
        }.padding()
    }

    func logouAndNavigateToLogin() {
        // Logout logic
    }
}

#Preview {
    ProfileView()
}
