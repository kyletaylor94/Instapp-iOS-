//
//  WhoLikesPostSheetView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 23..
//

import SwiftUI

//FIXME: - Maybe should add dependency -> swiftuiex to create searchbar!

struct WhoLikesPostSheetView: View {
    var body: some View {
        VStack{
            Text("likes")
                .bold()
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(spacing: 20) {
                    ForEach(0..<20) { index in
                        HStack{
                            Circle()
                                .frame(height: 50)
                            VStack{
                                Text("mockuser")
                                Text("real name")
                            }
                            
                            Spacer()
                            
                            createFollowOrFollowingButton(bool: index == 0 ? true : false)
                            
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func createFollowOrFollowingButton(bool: Bool) -> some View {
        if bool {
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
    NavigationStack {
        WhoLikesPostSheetView()
    }
}
