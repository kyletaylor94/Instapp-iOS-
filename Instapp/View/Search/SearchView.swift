//
//  SearchView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 22..
//

import SwiftUI
import SwiftUIX

struct SearchView: View {
    @State private var searchText: String = ""
    @Environment(SearchViewModel.self) var searchVM
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 20) {
                        ForEach(searchVM.searchedUsers) { user in
                            HStack{
                                Image(.mockPhoto)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                                    .clipShape(Circle())
                                
                                Text(user.username)
                                Spacer()
                            }
                        }
                    }
                    .padding(.leading)
                }
                .padding(.top)
            }
            .task { await searchVM.fetchAllUsers() }
            .searchable(text: $searchText)
            .onChange(of: searchText) { oldValue, newValue in
                Task { await  self.searchVM.searchForUsers(newValue, users: mockCurrentUser) }
            }
        }
    }
}

#Preview {
    NavigationStack{
        SearchView()
            .environment(SearchViewModel())
    }
}
