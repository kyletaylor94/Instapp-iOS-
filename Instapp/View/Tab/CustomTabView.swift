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
    @State private var authVM = AuthViewModel(interactor: AuthInteractorImpl(repository: AuthRepositoryImpl(service: AuthServiceImpl())))
    @State private var apiVM = ApiViewModel(interactor: ApiInteractorImpl(repository: ApiRepositoryImpl(service: ApiServiceImpl())))
    @State private var searchVM = SearchViewModel(interactor: SearchInteractorImpl(repository: SearchRepositoryImpl(service: SearchServiceImpl())))
    
    @State private var showUploadView = false
    @State private var selectedTab: TabItem = .feed

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
                    ProfileView()
                        .environment(authVM)
                }
            }
            .safeAreaInset(edge: .bottom) { createTabBar() }
        }
        .task { await authVM.fetchCurrentUser() }
        .fullScreenCover(isPresented: $showUploadView) { UploadView() }
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
    }
}

#Preview {
    CustomTabView()
        .environment(
            AuthViewModel(
                interactor: AuthInteractorImpl(
                    repository: AuthRepositoryImpl(
                        service: AuthServiceImpl()
                    )
                )
            )
        )
}
