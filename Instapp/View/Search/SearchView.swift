//
//  SearchView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 22..
//

import SwiftUI
import SwiftUIX

struct SearchView: View {
    var body: some View {
        VStack{
            SearchBar("Search...", text: .constant(""), isEditing: .constant(false))
                .showsCancelButton(false)
                       .onCancel { print("Canceled!") }
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
            }
            .padding(.top)
        }
    }
}

#Preview {
    NavigationStack{
        SearchView()
    }
}
