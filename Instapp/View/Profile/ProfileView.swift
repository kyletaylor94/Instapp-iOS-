//
//  ProfileView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 23..
//

import SwiftUI

struct ProfileView: View {
    let columns = [
        GridItem(.flexible(), spacing: 3),
        GridItem(.flexible(), spacing: 3),
        GridItem(.flexible(), spacing: 3)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                createProfileImageAndStats()
                
                VStack{
                    Button {
                        //edit profile following
                    } label: {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke()
                            .foregroundStyle(.black)
                            .overlay {
                                Text("Edit profile")
                                    .foregroundStyle(.black)
                            }
                            
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 30)

                }
                createCurrentUserImages()
            }
        }
    }
    private func createProfileImageAndStats() -> some View {
        HStack{
            VStack(alignment: .leading) {
                Circle()
                    .frame(height: 70)
                Text("user")
                    .frame(width: 70, alignment: .center)
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                createStat(value: 5, placeholder: "Posts")
                
                createStat(value: 10, placeholder: "Followers")
                
                createStat(value: 15, placeholder: "Following")
            }
            
            Spacer()
        }
        .padding()
    }
    private func createStat(value: Int, placeholder: String) -> some View {
        VStack(alignment: .leading) {
            Text("\(value)")
                .bold()
            
            Text(placeholder)
        }
    }
    
    private func createCurrentUserImages() -> some View {
        LazyVGrid(columns: columns, spacing: 3) {
            ForEach(0..<12, id: \.self) { _ in
                Rectangle()
                    .foregroundStyle(.blue)
                    .frame(height: 200)
            }
        }
    }
}

#Preview {
    ProfileView()
}
