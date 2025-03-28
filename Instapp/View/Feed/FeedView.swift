//
//  FeedView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 22..
//

import SwiftUI

struct FeedView: View {
    @State private var showComments: Bool = false
    @State private var showWhoLikesPost: Bool = false
    var body: some View {
        VStack{
            createStories()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 35) {
                    ForEach(0..<20) { _ in
                        createFeedCell()
                    }
                }
            }
            .padding(.top)
        }
    }
    private func createStories() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(0..<20) { index in
                    VStack{
                        Circle()
                            .stroke(lineWidth: 3)
                            .fill(
                                LinearGradient(colors: [.orange, .yellow,.pink, .purple], startPoint: .bottomLeading, endPoint: .topTrailing)
                            )
                            .frame(height: 70)
                            .overlay {
                                Circle()
                                    .frame(height: 62)
                            }
                        
                        Text(index == 0 ? "Your story" : "mockuser")
                    }
                }
            }
            .frame(height: 110)
        }
        .padding(.leading, 5)
    }
    
    private func createFeedCell() -> some View {
        VStack(spacing: 5) {
            HStack(alignment: .center) {
                Circle()
                    .frame(height: 30)
                
                Text("mockuser")
                    .font(.headline)
                
                Spacer()
            }
            .padding(5)
            
            Rectangle()
                .frame(height: 350)
                .frame(maxWidth: .infinity)
            
            HStack(spacing: 10) {
                HStack(spacing: 0) {
                    Image(systemName: "heart")
                    Text("32")
                        .font(.subheadline)
                }
                .font(.title2)

                Button {
                    showComments.toggle()
                } label: {
                    HStack(spacing: 0) {
                        Image(systemName: "bubble")
                        Text("5")
                            .font(.subheadline)
                    }
                    .font(.title2)
                }
                .sheet(isPresented: $showComments) {
                    CommentSheetView()
                        .padding(.top)
                        .presentationCornerRadius(12)
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.height(650)])
                }
                .foregroundStyle(.primary)

                
                Spacer()
            }
            .padding(5)
            
            HStack(spacing: 5) {
                Text("kyle ").fontWeight(.semibold) +
                Text("and")
                
                Button(action: {
                    showWhoLikesPost.toggle()
                }, label: {
                    Text("other people ").fontWeight(.semibold) +
                    Text("likes this")
                })
                .foregroundStyle(.primary)

                Spacer()
            }
            .padding(.horizontal, 10)
            .sheet(isPresented: $showWhoLikesPost) {
                WhoLikesPostSheetView()
                    .padding(.top)
                    .presentationCornerRadius(12)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(650)])
            }

            
            HStack{
                VStack(alignment: .leading) {
                    HStack{
                        Text("username")
                            .font(.headline)
                        
                        Text("this is the caption")
                    }
                    
                    Text("4 órája")
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    FeedView()
}
