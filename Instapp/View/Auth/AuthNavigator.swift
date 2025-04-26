//
//  AuthNavigator.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 13..
//

import SwiftUI

struct AuthNavigator: View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(\.dismiss) var dismiss
    var isRegisterView: Bool
    var body: some View {
        if !isRegisterView {
            VStack{
                NavigationLink {
                    RegisterView()
                        .environment(authVM)
                } label: {
                    Text("Don't you have an account? ").foregroundStyle(.white) +
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
        } else {
            VStack{
                Button {
                    dismiss()
                } label: {
                    Text("Already have an account? ").foregroundStyle(.white) +
                    Text("Sign In")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

