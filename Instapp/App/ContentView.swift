//
//  ContentView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 10..
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthViewModel.self) var authVM
    var body: some View {
        NavigationStack{
            CustomTabView()
                .environment(authVM)
        }
    }
}

#Preview {
    NavigationStack{
        ContentView()
    }
}
