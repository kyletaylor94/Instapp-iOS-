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
            
            LazyVStack {
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
                ForEach(0..<20) { _ in
                    Circle()
                        .frame(height: 70)
                }
            }
        }
        .padding()
    }
    
    private func createFeedCell() -> some View {
        VStack{
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
            
            HStack(spacing: 20) {
                HStack{
                    Image(systemName: "heart")
                    Text("32")
                }
                .font(.title2)

                HStack{
                    Image(systemName: "bubble")
                    Text("5")
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
            .padding(.horizontal)
        }
    }
}

#Preview {
    FeedView()
}
