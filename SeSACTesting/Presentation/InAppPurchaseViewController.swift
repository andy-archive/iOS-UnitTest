//
//  InAppPurchaseViewController.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/15/23.
//

import StoreKit
import UIKit


/*
 1. 유료 계약 활성화 / 개발자 계졍 / In App Purchase Capabilities
 2. AppStoreConnect In App Product 등록
 3. 인앱 구매: 사용자 결제 가능 여부 확인 + 상품 조회 -> SKProductRequest
 4. SKProductsRequestDelegate로 상품 정보 조회
 5. SKPaymentTransactionObserver로 사용자 결제 상태 확인 -> 예외 처리
 6. 인앱 결제 로직 성공 -> 
 */
final class InAppPurchaseViewController: BaseViewController {
    
    //MARK: - UI
    @IBOutlet private var productLabel: UILabel!
    
    //MARK: - Properties
    /*
     ✅ 1. 인앱 상품 ID 정의
     */
    var productIdentifier: Set<String> = ["com.andyarchive.oneotwo.removead"]
    var productArray = Array<SKProduct>()
    var product: SKProduct?
    
    //MARK: - Initializer
    
    //MARK: - Protocol Methods
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
            
            /* ✅ 3. 인앱 상품 조회 */
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
        SKPaymentQueue.default().add(self) // delegate 구현 필요 -> SKPaymentTransaction
        /* ⛔️ No exact matches in call to instance method 'add' */
    }
    
}

//MARK: - SKProductsRequestDelegate
extension InAppPurchaseViewController: SKProductsRequestDelegate {
    
    /* ✅ 4. 인앱 상품 정보 조회 */
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

//MARK: - SKPaymentTransactionObserver
/* 구매 승인, 취소에 대한 프로토콜 */
extension InAppPurchaseViewController: SKPaymentTransactionObserver {
    
    func receiptValidation(transaction: SKPaymentTransaction, productIdentifer: String) {
        
        /* ✅ 구매 영수증 정보 */
        guard
            let receiptFileURL = Bundle.main.appStoreReceiptURL,
            let receiptData = try? Data(contentsOf: receiptFileURL)
        else { return }
        
        let receiptString = receiptData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        print(receiptString)
    }
    
    /* ✅ 트랜잭션 업데이트 케이스 */ func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            
            switch transaction.transactionState {
            case .purchasing: // Transaction is being added to the server queue.
                print("구매 중")
            case .purchased: // Transaction is in queue, user has been charged. Client should complete the transaction.
                print("구매 완료 상태")
                print(transaction.payment.productIdentifier)
                
            case .failed: // Transaction was cancelled or failed before being added to the server queue.
                print("구매 실패")
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored: // Transaction was restored from user's purchase history.  Client should complete the transaction.
                print("구매 복원")
            case .deferred: // The transaction is in the queue, but its final status is pending external action.
                print("보류 중")
            @unknown default:
                print("default")
            }
        }
    }
}
