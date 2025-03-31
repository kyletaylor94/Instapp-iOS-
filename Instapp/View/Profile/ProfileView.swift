//
//  ProfileView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 23..
//

import SwiftUI
import ImageViewer

struct ProfileView: View {
    let columns = [
        GridItem(.flexible(), spacing: 3),
        GridItem(.flexible(), spacing: 3),
        GridItem(.flexible(), spacing: 3)
    ]
    
    @State private var isImagepresented = false
    @State private var selectedImage: Image?
    @State private var selectedImageTwo: Image?
    @State private var customViewer: Bool = false
    
        
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    createProfileImageAndStats()
                    
                    createEditButton { /*edit profile*/ }
                    
                    createCurrentUserImages()
                }
            }
            .blur(radius: customViewer ? 15 : 0)
            
            
            if let image = selectedImageTwo {
                VStack{
                    HStack{
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                customViewer = false
                                selectedImageTwo = nil
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundStyle(.black)
                        }

                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
                    Spacer()
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 230)
                        .clipShape(Circle())
                    
                    Spacer()

                }
            }
        }
        .fullScreenCover(isPresented: $isImagepresented) {
            ImageViewer(image: $selectedImage, viewerShown: self.$isImagepresented)
        }
    }
    private func createProfileImageAndStats() -> some View {
        HStack{
            VStack(alignment: .center) {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selectedImageTwo = Image(.mockPhoto)
                        customViewer.toggle()
                    }
                   
                } label: {
                    Image(.mockPhoto)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .clipShape(Circle())
                }


                
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
        .padding(.horizontal)
    }
    private func createStat(value: Int, placeholder: String) -> some View {
        VStack(alignment: .leading) {
            Text("\(value)")
                .bold()
            
            Text(placeholder)
        }
    }
    
    private func createEditButton(task: @escaping () ->()) -> some View {
        VStack{
            Button {
                task()
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
    }
    
    private func createCurrentUserImages() -> some View {
        LazyVGrid(columns: columns, spacing: 3) {
            ForEach(0..<12, id: \.self) { _ in
                Button {
                    selectedImage = Image(.mockPhoto)
                    isImagepresented.toggle()
                } label: {
                    Image(.mockPhoto)
                        .resizable()
                        .clipShape(Rectangle())
                        .frame(height: 200)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}




struct CustomPictureView: View {
    @Binding var selectedImage: Image?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()

            VStack{
                HStack{
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .font(.title2)
                    }

                }
                .padding()

                Spacer()

                if let selectedImage {
                    selectedImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 230)
                        .clipShape(Circle())
                }

                Spacer()

            }
        }
    }
}
