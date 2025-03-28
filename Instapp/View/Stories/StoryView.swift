//
//  StoryView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 26..
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(.black)
                .ignoresSafeArea(edges: [.top])
            
            //MARK: - Custom hidden button that can allows user to steps between pictures
            HStack{
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(width: 100)
                    .maxHeight(.infinity)
                    .padding(.top, 40)
                
                Spacer()
            }
            
            HStack{
                Spacer()
                
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(width: 100)
                    .maxHeight(.infinity)
                    .padding(.top, 40)
            }
            
            VStack{
                HStack{
                    Circle()
                        .frame(height: 30)
                        .foregroundStyle(.gray)
                    
                    Text("username")
                        .foregroundStyle(.white)
                    
                    Text("1d")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Button {
                        //dismiss
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    
                }
                .padding(.horizontal)
               
                //implement here a timer for pictures
                
                Spacer()
            }
        }
    }
}

#Preview {
    StoryView()
}
