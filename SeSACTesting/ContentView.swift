//
//  ContentView.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var emailText = ""
    @State private var idText = ""
    @State private var passwordText = ""
    
    var body: some View {
        VStack {
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
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
