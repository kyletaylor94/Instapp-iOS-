//
//  CustomTabView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 22..
//

import SwiftUI

enum TabItem: String, CaseIterable, Identifiable {
    case feed = "house.fill"
    case search = "magnifyingglass"
    case upload = "plus"
    case notifications = "bell.fill"
    case profile = "person.fill"
        
    var id: String { return self.rawValue }
}

struct CustomTabView: View {
  //  @State private var authVM = AuthViewModel()
    @Environment(AuthViewModel.self) var authVM
    
    @State private var apiVM = PostViewModel()
    @State private var searchVM = SearchViewModel()
    
    @State private var showUploadView = false
    @State private var selectedTab: TabItem = .feed
    
    @State private var isHidingTabBar = false

    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .feed:
                    FeedView()
                        .environment(apiVM)
                    
                case .search:
                    SearchView()
                        .environment(searchVM)
                    
                case .upload:
                    EmptyView()
                    
                case .notifications:
                    NotificationsView()
                    
                case .profile:
                    ProfileView(hideTabBar: $isHidingTabBar)
                        .environment(authVM)
                }
            }
            .safeAreaInset(edge: .bottom) { createTabBar() }
        }
        .task { await authVM.fetchCurrentUser() }
        .fullScreenCover(isPresented: $showUploadView) { UploadView() }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    Task { await  authVM.logOut() }
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
            }
        }
    }
    @ViewBuilder
    private func createTabBar() -> some View {
        Rectangle()
            .overlay {
                HStack(alignment: .top, spacing: 50) {
                    ForEach(TabItem.allCases) { tab in
                        Button {
                            if tab == .upload {
                                showUploadView = true
                            } else {
                                selectedTab = tab
                            }
                        } label: {
                            Image(systemName: tab.rawValue)
                                .font(.title2)
                                .foregroundStyle(selectedTab == tab ? .blue : .gray)
                                .offset(y: -10)
                        }
                    }
                }
            }
            .frame(height: 70)
            .offset(y: 35)
            .foregroundStyle(.white)
            .opacity(isHidingTabBar ? 0 : 1)
    }
}

#Preview {
    CustomTabView()
        .environment(AuthViewModel())
}
