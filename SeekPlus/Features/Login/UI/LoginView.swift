//
//  LoginView.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @State private var email = ""
    @State private var password = ""
    @FocusState private var focusedField: LoginField?
    
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            headerView
            Spacer().frame(height: Margin.xxxLarge.value)
            signInView
        }
    }
}

// MARK: - Header View
extension LoginView {
    var headerView: some View {
        HStack(alignment: .center, spacing: Margin.large.value) {
            Image("SeekLogo", bundle: Bundle.main)
                .configurableImageStyle(ImageAttributes(renderingMode: .original,
                                                        size: CGSize(width: 48,
                                                                     height: 48)))
            
            Text("SeekPlus")
                .textStyle(TextAttributes(style: .largeTitle,
                                          weight: .bold,
                                          color: AppColor.backgroundBrand.color))
            Spacer()
        }.padding(.leading, Margin.xLarge.value)
    }
}

// MARK: - Sign in View
extension LoginView {
    var signInView: some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            Text("Sign in")
                .textStyle(TextAttributes(style: .largeTitle,
                                          weight: .semibold))
            Spacer().frame(height: Margin.xLarge.value)
            
            emailField
            Spacer().frame(height: Margin.xLarge.value)
            
            passwordField
            Spacer().frame(minHeight: Margin.large.value)
        }.padding([.leading, .trailing], Margin.xLarge.value)
    }
    
    var emailField: some View {
        VStack (alignment: .leading, spacing: Margin.zero.value) {
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
        VStack (alignment: .leading, spacing: Margin.zero.value) {
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
            
            Spacer().frame(height: Margin.xxxLarge.value)
            
            Button {
                // Button action
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity)
            }.buttonStyle(ConfigurableButtonStyle())
        }
    }
}

#Preview {
    LoginView()
}
