//
//  FeedView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 22..
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            createStories()
            
            LazyVStack(spacing: 35) {
                ForEach(0..<20) { _ in
                    createFeedCell()
                }
            }
        }
        .padding(.top)
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
        .padding()
    }
    
    private func createFeedCell() -> some View {
        VStack(spacing: 5){
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

                HStack(spacing: 0){
                    Image(systemName: "bubble")
                    Text("5")
                        .font(.subheadline)
                }
                .font(.title2)
                
                Spacer()
            }
            .padding(5)
            
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
