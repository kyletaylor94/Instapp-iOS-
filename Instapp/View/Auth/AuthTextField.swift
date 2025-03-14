//
//  AuthTextField.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 13..
//

import SwiftUI

@ViewBuilder
func createTextField(icon: String, placeholder: String, text: Binding<String>, isSecureField: Bool) -> some View {
    HStack{
        Image(systemName: icon)
            .foregroundStyle(.white)
        
        if isSecureField {
            SecureField("", text: text, prompt: Text(placeholder).foregroundStyle(.white))

        } else {
            TextField("", text: text, prompt: Text(placeholder).foregroundStyle(.white))
        }
    }
    .padding(.horizontal)
    .frame(width: UIScreen.main.bounds.width - 32 ,height: 50)
    .background(RoundedRectangle(cornerRadius: 8))
    .foregroundStyle(.thinMaterial)
}
