//
//  StoreView.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/18/23.
//

import SwiftUI

struct StoreView: View {
    var body: some View {
        HStack {
            Text("Remove Ad")
            Spacer()
            Button("$99.99") {
                print("Button")
            }
        }
    }
}

#Preview {
    StoreView()
}
