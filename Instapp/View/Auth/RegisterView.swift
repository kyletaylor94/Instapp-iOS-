//
//  RegisterView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 13..
//

import SwiftUI
import PhotosUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var userName: String = ""
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 100)
                
                createAvatarPicker()
                
                VStack{
                    createTextField(icon: "envelope", placeholder: "Email", text: $email, isSecureField: false)
                    
                    createTextField(icon: "lock", placeholder: "Password", text: $password, isSecureField: true)
                    
                    createTextField(icon: "person", placeholder: "Full name", text: $fullName, isSecureField: false)
                    
                    createTextField(icon: "person", placeholder: "Username", text: $userName, isSecureField: false)
                    
                    AuthButton(void: {
                        //sign up method
                    }, placeholder: "Sign Up")
                    
                    Spacer()
                    
                    AuthNavigator(isRegisterView: true)
                }
            }
        }
    }
    @ViewBuilder
    private func createAvatarPicker() -> some View {
        VStack{
            PhotosPicker(selection: $avatarItem, matching: .images) {
                if let avatarImage = avatarImage {
                    avatarImage
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.white)
                }
            }
        }
        .onChange(of: avatarItem) { oldValue, newValue in
            Task {
                if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                    avatarImage = loaded
                } else {
                    print("Failed")
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
