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
                HStack{
                    Circle()
                        .frame(height: 70)
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        VStack(alignment: .leading) {
                            Text("5")
                                .bold()
                            Text("posts")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("10")
                                .bold()
                            
                            Text("Followers")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("15")
                                .bold()
                            
                            Text("Following")
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProfileView()
}
