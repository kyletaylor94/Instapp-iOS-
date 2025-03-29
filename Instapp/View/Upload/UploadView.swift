//
//  UploadView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 28..
//

import SwiftUI
import ExyteMediaPicker

enum UploadType: String, Identifiable ,CaseIterable {
    case post = "Post"
    case story = "Story"
    
    var id: String { return self.rawValue }
}

struct UploadView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedType: UploadType = .post
    @State private var isPresented: Bool = false
    @State private var selectedMedia: [Media] = []
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                createUploadNavbar()
                
                MediaPicker(
                    isPresented: $isPresented,
                    onChange: { selectedMedia = $0 },
                    albumSelectionBuilder: { defaultHeaderView, albumSelectionView, isInFullscreen in
                        VStack {
                            if !isInFullscreen {
                                defaultHeaderView
                            }
                            albumSelectionView
                            
                            Spacer()
                            
                        }
                        .background(Color.black)
                    }
                )
                postTypeSelector()
            }
            .navigationBarBackButtonHidden()
        }
    }
    private func createUploadNavbar() -> some View {
        HStack{
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.title3)
            }
            
            Spacer()

            
            Text("New post")
                .foregroundStyle(.white)
            
            Spacer()

            Button {
                //next
            } label: {
                Text("Next")
                    .foregroundStyle(.blue)
            }
            
        }
        .padding(.horizontal)
    }
    private func postTypeSelector() -> some View {
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
}

#Preview {
    UploadView()
}
