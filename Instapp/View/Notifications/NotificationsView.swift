//
//  NotificationsView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 26..
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(0..<5) { index in
                    HStack{
                        Circle()
                            .frame(height: 40)
                        Text("username ").fontWeight(.semibold) +
                        Text("likes your post ") +
                        Text("\n1d").foregroundStyle(.gray)
                        
                        Spacer()
                        
                        createFollowOrFollowingButton(following: index == 2 ? true : false)

                    }
                    .padding(.horizontal, 5)
                }
            }
            .multilineTextAlignment(.leading)

        }
    }
    @ViewBuilder
    private func createFollowOrFollowingButton(following: Bool) -> some View {
        if following {
            Button {
                //
            } label: {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(style: StrokeStyle())
                
            }
            .frame(width: 100, height: 30)
            .foregroundStyle(.black)
            .overlay {
                Text("Following")
            }
        } else {
            Button {
                //
            } label: {
                RoundedRectangle(cornerRadius: 8)
            }
            .frame(width: 100, height: 30)
            .foregroundStyle(.blue)
            .overlay {
                Text("Follow")
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    NotificationsView()
}
