//
//  AuthButton.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 13..
//

import SwiftUI

struct AuthButton: View {
    let void: () -> Void
    let placeholder: String
    var body: some View {
        VStack{
            Button {
                void()
            } label: {
                Capsule()
                    .overlay {
                        Text(placeholder)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
            }
            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
            .foregroundStyle(.ultraThinMaterial)

        }
        .padding(.top)
    }
}

