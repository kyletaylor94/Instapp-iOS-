//
//  CustomTabView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 22..
//

import SwiftUI

enum TabItem: String, CaseIterable, Identifiable {
    case feed = "house"
    case search = "magnifyingglass"
    case upload = "plus"
    case notifications = "bell"
    case profile = "person"
        
    var id: String { return self.rawValue }
}

struct CustomTabView: View {
    @State private var showUploadView = false
    @State private var selectedTab: TabItem = .feed

    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .feed:
                    FeedView()
                case .search:
                    SearchView()
                case .upload:
                    EmptyView()
                case .notifications:
                    NotificationsView()
                case .profile:
                    ProfileView()
                }
            }
            .safeAreaInset(edge: .bottom) {
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
        .fullScreenCover(isPresented: $showUploadView) {
            UploadView()
        }
    }
}

#Preview {
    CustomTabView()
}
