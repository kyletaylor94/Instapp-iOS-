//
//  UploadView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 28..
//

import SwiftUI

enum UploadType: String, Identifiable ,CaseIterable {
    case post = "Post"
    case story = "Story"
    
    var id: String { return self.rawValue }
}

struct UploadView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedType: UploadType = .post
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Rectangle()
                    .foregroundStyle(.gray)
                    .frame(height: 520)
                    .maxWidth(.infinity)
                
                Spacer()
                
                VStack {
                    Capsule()
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(width: UIScreen.main.bounds.width - 122 , height: 30, alignment: .center)
                        .overlay {
                            HStack(spacing: 30) {
                                ForEach(UploadType.allCases) { type in
                                    Button {
                                        selectedType = type
                                    } label: {
                                        Text(type.rawValue)
                                            .foregroundStyle(selectedType == type ? .white: .gray)
                                    }
                                }
                            }
                        }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        //dismiss
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .font(.title3)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("New post")
                        .foregroundStyle(.white)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //next
                    } label: {
                        Text("Next")
                            .foregroundStyle(.blue)
                    }

                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        UploadView()
    }
}
