//
//  ContentView.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/8/23.
//

import SwiftUI

//MARK: - ContentView
struct ContentView: View {
    
    @State private var emailText = ""
    @State private var idText = ""
    @State private var passwordText = ""
    @State private var showPage = false
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            TextField("📧 Email", text: $emailText)
                .font(.title)
                .foregroundStyle(Color.green)
                .accessibilityIdentifier("emailTextField")
                .accessibilityLabel("이메일 기입란")
            TextField("🪪 ID", text: $idText)
                .accessibilityIdentifier("idTextField")
            TextField("🗝️ Password", text: $passwordText)
                .accessibilityIdentifier("passwordTextField")
            Button("LOGIN") {
                showPage = true
            }
            Button("Lotto Network") {
                NetworkManager.shared.fetchLotto(number: 1000) { lotto in
                    print(lotto.bnusNo, lotto.drwtNo1, lotto.drwNoDate, separator: "\n")
                    
                }
            }
            .accessibilityIdentifier("loginButton")
        }
        .padding()
        .sheet(isPresented: $showPage, content: {
            NextView()
        })
    }
}

//MARK: - NextView (presented from ContentView)
struct NextView: View {
    
    var body: some View {
        Text("NEXT View")
    }
}

#Preview {
    ContentView()
}
