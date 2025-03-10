//
//  LoginView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 10..
//

import SwiftUI

struct LoginView: View {
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
                    HStack{
                        Image(systemName: "envelope")
                            .foregroundStyle(.white)
                        TextField("", text: .constant(""), prompt: Text("Email").foregroundStyle(.white))

                    }
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width - 32 ,height: 50)
                    .background(RoundedRectangle(cornerRadius: 8))
                    .foregroundStyle(.thinMaterial)
                    
                    HStack{
                        Image(systemName: "lock")
                            .foregroundStyle(.white)
                        
                        SecureField("", text: .constant(""), prompt: Text("Password").foregroundStyle(.white))
                    }
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width - 32 ,height: 50)
                    .background(RoundedRectangle(cornerRadius: 8))
                    .foregroundStyle(.thinMaterial)
                    
                    VStack{
                        HStack{
                            Spacer()
                            Button {
                                //forgot password
                            } label: {
                                Text("Forgot password?")
                            }
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        }
                        .padding(.trailing)
                        .padding(.top)
                    }
                    
                    VStack{
                        Button {
                            //sign in
                        } label: {
                            Capsule()
                                .overlay {
                                    Text("Sign In")
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)
                                }
                        }
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .foregroundStyle(.ultraThinMaterial)

                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    VStack{
                        NavigationLink {
                            //register
                        } label: {
                            Text("Don't you have an account? ").foregroundStyle(.white) +
                            Text("Sign up")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }

                    }
                    
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
