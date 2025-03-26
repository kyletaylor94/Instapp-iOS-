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
    case add = "plus"
    case notifications = "bell"
    case profile = "person"
    
    var view: AnyView {
        switch self {
        case .feed: return AnyView(FeedView())
        case .search: return AnyView(SearchView())
        case .add: return AnyView(EmptyView())
        case .notifications: return AnyView(NotificationsView())
        case .profile: return AnyView(ProfileView())
        }
    }
    
    var id: String { return self.rawValue }
}

struct CustomTabView: View {
    
    init() { UITabBar.appearance().isTranslucent = false }
    var body: some View {
        TabView {
            ForEach(TabItem.allCases) { tab in
                Tab("", systemImage: tab.rawValue) {
                    tab.view
                }
            }
        }
        .tint(.black)
    }
}

#Preview {
    CustomTabView()
}
