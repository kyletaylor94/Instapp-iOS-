//
//  WhoLikesPostSheetView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 23..
//

import SwiftUI
import SwiftUIX

struct WhoLikesPostSheetView: View {
    var body: some View {
        VStack{
            Text("Likes")
                .bold()
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(spacing: 20) {
                    SearchBar("Search...", text: .constant(""), isEditing: .constant(false))
                        .showsCancelButton(false)
                        .onCancel { print("Canceled!") }
                        .padding(.horizontal, 5)
                    
                    ForEach(0..<20) { index in
                        HStack{
                            Circle()
                                .frame(height: 50)
                            
                            VStack{
                                Text("mockuser")
                                Text("real name")
                            }
                            
                            Spacer()
                                                        
                            createFollowOrFollowingButton(following: index == 0 ? true: false) {
                                //task
                            }
                            
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        WhoLikesPostSheetView()
    }
}

