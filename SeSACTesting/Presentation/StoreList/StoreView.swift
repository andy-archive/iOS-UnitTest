//
//  StoreView.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/18/23.
//

import SwiftUI

struct StoreView: View {
    
    //MARK: - Properties
    @StateObject var shop = SeSACShop()
    
    //MARK: - UI
    var body: some View {
        HStack {
            Text("Remove Ad")
            Spacer()
            Button("$99.99") {
                print("Button")
            }
        }
        .padding()
        .task {
            await shop.fetchAllProducts()
        }
    }
}

#Preview {
    StoreView()
}
