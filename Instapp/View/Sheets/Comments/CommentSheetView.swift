//
//  CommentSheetView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 23..
//

import SwiftUI

struct CommentSheetView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Comments")
                    .bold()
            }
            Divider()
            
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(0..<30) { _ in
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Circle()
                                .frame(height: 40)
                            VStack(alignment: .leading) {
                                HStack(spacing: 5){
                                    Text("mockuser")
                                        .bold()
                                    Text("24 ó")
                                        .foregroundStyle(.gray)
                                }
                                HStack(alignment: .top, spacing: 30) {
                                    Text("mock comment mock comment mock comment mock comment mock comment mock comment")
                                    
                                    VStack(spacing: 10) {
                                        Button {
                                            //heart
                                        } label: {
                                            Image(systemName: "heart")
                                                .foregroundStyle(.gray)
                                        }
                                        Text("4")
                                    }
                                    
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.top)
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            VStack{
                Divider()
                HStack(spacing: 25){
                    ForEach(0..<8) { _ in
                        Text("✅")
                            .font(.title2)
                    }
                }
                HStack{
                    Circle()
                        .frame(height: 50)
                    
                    Capsule()
                        .stroke(.gray,lineWidth: 0.5)
                        .frame(width: UIScreen.main.bounds.width - 70, height: 40)
                        .overlay {
                            HStack{
                                Text("Comment: tomockuser....")
                                    .foregroundStyle(.gray)
                                Spacer()
                                
                                Button {
                                    //send the comment
                                    // in default -> hidden -> if textfield is not empty -> show
                                } label: {
                                    Capsule()
                                        .frame(width: 45, height: 28)
                                        .foregroundStyle(.blue)
                                        .overlay {
                                            Image(systemName: "arrow.up")
                                                .fontWeight(.heavy)
                                                .foregroundStyle(.white)
                                        }
                                }

                            }
                            .padding(.horizontal, 5)
                        }
                }
                .padding(.horizontal)
            }
            .background()
        }
    }
}

#Preview {
    CommentSheetView()
}
