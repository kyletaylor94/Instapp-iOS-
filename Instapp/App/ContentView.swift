//
//  ContentView.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 03. 10..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            CustomTabView()
        }
    }
}

#Preview {
    NavigationStack{
        ContentView()
    }
}
