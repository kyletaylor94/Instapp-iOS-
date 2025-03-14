//
//  LoginView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 10..
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        ZStack{
            LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 100)
                
                VStack{
                    createTextField(icon: "envelope", placeholder: "Email", text: $email, isSecureField: false)

                    createTextField(icon: "lock", placeholder: "Password", text: $password, isSecureField: true)

                    createForgotPassword()
                    
                    AuthButton(void: {
                        //sign in
                    }, placeholder: "Sign In")
                    
                    Spacer()
                    
                    AuthNavigator(isRegisterView: false)
                }
            }
        }
    }
    private func createForgotPassword() -> some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    //forgot password method
                } label: {
                    Text("Forgot password?")
                }
                .foregroundStyle(.white)
                .fontWeight(.semibold)
            }
            .padding(.trailing)
            .padding(.top)
        }
    }
}

#Preview {
    LoginView()
}
