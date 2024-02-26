//
//  LoginView.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct LoginView<ViewModel>: View where ViewModel: LoginViewModel {
    // MARK: - Properties
    @ObservedObject private var loginViewModel: ViewModel

    //    @State private var loginSuccessful: Bool = false
    @State private var email = ""
    @State private var password = ""
    @FocusState private var focusedField: LoginField?

    init(loginViewModel: any LoginViewModelContract) {
        self.loginViewModel = loginViewModel as! ViewModel // swiftlint:disable:this force_cast
    }

    // MARK: - View
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: Margin.zero.value) {
                headerView
                Spacer().frame(height: Margin.xxxLarge.value)
                signInView
            }
            .navigationDestination(isPresented: $loginViewModel.isTokenSavedSuccessfully) {
                TabBarView()
            }
        }
    }
}

// MARK: - Header View
private extension LoginView {
    var headerView: some View {
        HStack(alignment: .center, spacing: Margin.large.value) {
            Image("SeekLogo", bundle: Bundle.main)
                .configurableImageStyle(
                    ImageAttributes(renderingMode: .original,
                                    size: CGSize(width: ImageSize.xxLarge.value,
                                                 height: ImageSize.xxLarge.value)))

            Text("SeekPlus")
                .textStyle(TextAttributes(style: .largeTitle,
                                          weight: .bold,
                                          color: AppColor.backgroundBrand.color))
            Spacer()
        }.padding(.leading, Margin.xLarge.value)
    }
}

// MARK: - Sign in View
private extension LoginView {
    var signInView: some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            Text("Sign in")
                .textStyle(TextAttributes(style: .largeTitle,
                                          weight: .semibold))
            Spacer().frame(height: Margin.xLarge.value)

            emailField
            Spacer().frame(height: Margin.xLarge.value)

            passwordField
            //            Spacer().frame(minHeight: Margin.large.value)
            Spacer().frame(minHeight: Margin.xxxLarge.value)

            loginButtonView
        }.padding([.leading, .trailing], Margin.xLarge.value)
    }

    var emailField: some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            // Email address field
            Text("Email address")
                .textStyle(TextAttributes(style: .title2,
                                          weight: .semibold))
            Spacer().frame(height: Margin.default.value)

            TextField("",
                      text: $email)
            .focused($focusedField, equals: .email)
            .textContentType(.emailAddress)
            .textFieldStyle(DefaultTextFieldStyle(isEditing: focusedField == .email))
            .submitLabel(.next)
        }
    }

    var passwordField: some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            // Password field
            Text("Password")
                .textStyle(TextAttributes(style: .title2,
                                          weight: .semibold))
            Spacer().frame(height: Margin.default.value)

            SecureField("",
                        text: $password)
            .focused($focusedField, equals: .password)
            .textContentType(.password)
            .textFieldStyle(DefaultTextFieldStyle(isEditing: focusedField == .password))
            .submitLabel(.done)
        }
    }

    var loginButtonView: some View {
        VStack(alignment: .center, spacing: Margin.zero.value) {
            Button {
                self.login()
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity)
            }.buttonStyle(ConfigurableButtonStyle())
        }
    }

    func login() {
        self.loginViewModel.login(email, password)
    }
}

// #Preview {
//    LoginView()
// }
