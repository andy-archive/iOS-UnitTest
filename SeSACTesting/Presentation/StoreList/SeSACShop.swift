//
//  SeSACShop.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/18/23.
//

import Foundation
import StoreKit

final class SeSACShop: ObservableObject {
    
    //MARK: - Properties
    /// 인앱 상품 조회
    @Published var allProducts: [Product] = []
    
    //MARK: - Private Methods
    func fetchAllProducts() async {
        do {
            let product = try await Product.products(
                for: [
                    "com.andyarchive.SeSACTesting.removeAd",
                    "com.andyarchive.SeSACTesting.premium"
                ]
            )
            allProducts = product
        } catch {
            print(error.localizedDescription)
        }
    }
}
