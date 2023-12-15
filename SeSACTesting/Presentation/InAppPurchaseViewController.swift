//
//  InAppPurchaseViewController.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/15/23.
//

import StoreKit
import UIKit

final class InAppPurchaseViewController: BaseViewController {
    
    //MARK: - (1-1) UI
    @IBOutlet private var productLabel: UILabel!
    
    //MARK: - (1-2) Properties
    /*
     ✅ 1. 인앱 상품 ID 정의
     */
    var productIdentifier: Set<String> = ["com.andyarchive.oneotwo.removead"]
    var productArray = Array<SKProduct>()
    var product: SKProduct?
    
    //MARK: - (2) Initializer
    
    //MARK: - (3) Protocol Methods
    override func configureUI() {
        super.configureUI()
    }
}

//MARK: - StoreKit
extension InAppPurchaseViewController {
    
    /*
     ✅ 2. productIdentifier에 정의한 상품 아이디 정보 가져 오기
            + 사용자의 디바이스가 인앱 결제 가능한가?
     */
    func requestProductData() {
        if SKPaymentQueue.canMakePayments() {
            print("canMakePayments")
            
            /*
             ✅ 3. 인앱 상품 조회
             */
            let request = SKProductsRequest(productIdentifiers: productIdentifier)
            request.delegate = self
            request.start()
        } else {
            print("In App Purchase NOT ENABLED")
        }
    }
    
    /*
     ✅ 5. 구매 버튼 클릭
     */
    @IBAction private func buyButtonClicked(_ sender: UIButton) {
        guard let product else { return }
        let payment = SKPayment(product: product)
        
        SKPaymentQueue.default().add(payment)
        SKPaymentQueue.default().add(self) // delegate 구현 필요
        // ⛔️ No exact matches in call to instance method 'add'
    }
    
}

//MARK: - SKProductsRequestDelegate
extension InAppPurchaseViewController: SKProductsRequestDelegate {
    
    /*
     ✅ 4. 인앱 상품 정보 조회
     */
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let products = response.products
        
        if products.count > 0 {
            
            for item in products {
                productArray.append(item)
                product = item // 옵션
                
                print(item.productIdentifier)
                print(item.localizedTitle)
                print(item.price)
                print(item.priceLocale)
            }
        }
    }
}
