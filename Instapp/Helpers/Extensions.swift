//
//  Extensions.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 28..
//

import Foundation
import SwiftUI

extension View {
    func createFollowOrFollowingButton(following: Bool, action: @escaping () -> ()) -> some View {
        Button(action: action) {
            Text(following ? "Following" : "Follow")
                .font(.system(size: 14, weight: .bold))
                .frame(width: 100, height: 30)
                .background(following ? Color.clear : Color.blue)
                .foregroundColor(following ? .black : .white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(following ? 0.5 : 0), lineWidth: 1)
                )
        }
    }
}
