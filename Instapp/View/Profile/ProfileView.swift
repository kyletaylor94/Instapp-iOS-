//
//  ProfileView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 23..
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                createProfileImageAndStats()
            }
        }
    }
    private func createProfileImageAndStats() -> some View {
        HStack{
            Circle()
                .frame(height: 70)
            
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
}

#Preview {
    ProfileView()
}
