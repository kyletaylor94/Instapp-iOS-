//
//  InstappApp.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 10..
//

import SwiftUI

@main
struct InstappApp: App {
    @State private var authVM = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            Group {
                if authVM.currentUserFromAPI != nil {
                    ContentView()
                        .environment(authVM)
                } else {
                    LoginView()
                        .environment(authVM)
                }
            }
            .onAppear{
                Task { await authVM.checkLoginStatus() } }
        }
    }
}
