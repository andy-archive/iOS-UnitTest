//
//  StoreView.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/18/23.
//

import StoreKit
import SwiftUI

struct StoreView: View {
    
    //MARK: - Properties
    @StateObject var shop = SeSACShop()
    
    //MARK: - UI
    var body: some View {
        VStack {
            HStack {
                Text("Remove Ad")
                Spacer()
                Button("$99.99") {
                    print("Button")
                }
            }
            /// ProductView & SubscriptionStoreView (iOS 17.0+)
            ForEach(shop.allProducts, id: \.id) { item in
                ProductView(item) /// iOS 17.0
                    .productViewStyle(.regular) // .compact
                //SubscriptionStoreView()
            }
        }
        .padding()
        .task {
            await shop.fetchAllProducts() /// 2, 3, 4
        }
    }
}

//MARK: - Preview
#Preview {
    StoreView()
}
