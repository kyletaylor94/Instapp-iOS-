//
//  CommentSheetView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 23..
//

import SwiftUI

struct CommentSheetView: View {
    @State private var selectedEmoji: String = ""
    var emojis: [String] = ["🤩", "😱", "😍", "🥰", "😎", "❤️", "😜", "👀"]
    var comments: [Comments]
    
    @State private var commentText: String = ""
   
    var body: some View {
        VStack{
            HStack{
                Text("Comments")
                    .bold()
            }
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    ForEach(comments) { comment in
                       createCommentCell()
                    }
                    .padding(.horizontal, 8)
                    .padding(.top)
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            commentTextField()
        }
    }
    private func createCommentCell() -> some View {
        HStack(alignment: .top) {
            Circle()
                .frame(height: 40)
            
            VStack(alignment: .leading) {
                HStack(spacing: 5){
                    Text("username")
                        .bold()
                    
                    Text("24 ó")
                        .foregroundStyle(.gray)
                }
                HStack(alignment: .top, spacing: 30) {
                    Text("comment comment comment comment")
                    
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
    
    @ViewBuilder
    private func createEmojiCell() -> some View {
        HStack(spacing: 25) {
            ForEach(emojis, id: \.self) { emoji in
                Button {
                    selectedEmoji = emoji
                    commentText.append(emoji)
                } label: {
                    Text(emoji)
                        .font(.title2)
                }
            }
        }
    }
    
    @ViewBuilder
    private func commentTextField() -> some View {
        VStack{
            Divider()
            createEmojiCell()
            
            HStack{
                Circle()
                    .frame(height: 50)
                
                Capsule()
                    .stroke(.gray,lineWidth: 0.5)
                    .frame(width: UIScreen.main.bounds.width - 70, height: 45)
                    .overlay {
                        HStack{
                            TextField("Commen: tomockuser....", text: $commentText, axis: .vertical)
                                .padding(.horizontal, 5)
                            
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

#Preview {
    CommentSheetView(comments: mockPosts[0].comments)
   // CommentSheetView()
    //CommentSheetView(comments: mockPosts[0].comments)
}
