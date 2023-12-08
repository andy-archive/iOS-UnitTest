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
            TextField("🪪 ID", text: $idText)
            TextField("🗝️ Password", text: $passwordText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
