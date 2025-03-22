//
//  SearchView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 22..
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<20) { _ in
                    HStack{
                        Circle()
                            .frame(height: 40)
                        Text("mock search")
                        Spacer()
                    }
                }
            }
            .padding(.leading)
            .searchable(text: .constant(""), placement: .toolbar)
        }
        .padding(.top)
    }
}

#Preview {
    NavigationStack{
        SearchView()
    }
}
