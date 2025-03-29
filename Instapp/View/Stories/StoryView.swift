//
//  InstagramStoryExample.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 29..
//

import SwiftUI

struct StoryView: View {
    @ObservedObject var storyTimer: StoryTimer = StoryTimer(items: 3, interval: 3.0)
    @Environment(\.dismiss) var dismiss

    private var imagesNames: [String] = [
        "mockPhoto",
        "mockPhoto2",
        "mockPhoto3"
    ]
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Image(imagesNames[Int(self.storyTimer.progress)])
                    .resizable()
                    .ignoresSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geo.size.width, height: nil, alignment: .center)
                
                VStack{
                    createStoryNavBar()
                    
                    HStack(alignment: .center, spacing: 4) {
                        ForEach(imagesNames.indices, id: \.self) { x in
                            loadingRectangle(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0) , 1.0) )
                                .frame(width: nil, height: 2, alignment: .leading)
                                .animation(.linear, value: self.storyTimer.progress)
                        }
                    }
                    .padding()
                }
                
                HStack(alignment: .center, spacing: 0) {
                    stepperButton { self.storyTimer.advance(by: -1) }
                    
                    stepperButton { self.storyTimer.advance(by: 1) }

                }
            }
            .navigationBarBackButtonHidden()
        }
        .onAppear {
            self.storyTimer.start()
        }
    }
    
    private func createStoryNavBar() -> some View {
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
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func stepperButton(task: @escaping () -> ()) -> some View {
            Button {
                task()
            } label: {
                Rectangle()
                    .foregroundColor(.clear)
            }
            .padding(.top, 80)
    }
    
    @ViewBuilder
    private func loadingRectangle(progress: CGFloat) -> some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.white.opacity(0.3))
                    
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.white.opacity(0.9))
                    .frame(width: geo.size.width * progress, height: nil, alignment: .leading)
            }
        }
    }
}

#Preview {
    StoryView()
}
