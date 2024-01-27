//
//  ContentView.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import SwiftUI

struct ContentView: View {
    @State private var isPresentWebView = false

    var body: some View {
        Button("Open WebView") {
            isPresentWebView = true
        }
        .sheet(isPresented: $isPresentWebView) {
            NavigationStack {
                SafariView(url: URL(string: "https://github.com/signalapp/Signal-iOS")!)
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ContentView()
}
