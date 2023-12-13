//
//  NetworkTestCase.swift
//  SeSACTestingTests
//
//  Created by Taekwon Lee on 12/13/23.
//

import XCTest
@testable import SeSACTesting

final class NetworkTestCase: XCTestCase {
    
    var sut: NetworkManager! /* init 원하지 않을 때 ? or !*/
    
    override func setUpWithError() throws {
        sut = NetworkManager.shared
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    /* ⭐️ Unit Test는 동기 테스트에 최적화 되어 있다
     비동기 테스트 - expectation / fulfill / wait
     */
    func testExample() throws {
        print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
        
        //MARK: - (1) expectation
        let promise = expectation(description: "LottoAPI completion")
        
        sut.fetchLotto(number: 1000) { lotto in
            print("🕸️🕸️🕸️🕸️🕸️🕸️🕸️🕸️🕸️🕸️🕸️🕸️🕸️🕸️") // 비동기라 되지 않음
            print(lotto.bnusNo, lotto.drwNoDate)
            
            var testNumber = lotto.bnusNo
            
            XCTAssertGreaterThanOrEqual(testNumber, 1)
            XCTAssertLessThanOrEqual(testNumber, 45)
            
            //MARK: - (2) fulfill
            promise.fulfill() // 정의한 expectation 충족 시점에 호출하여 동작을 수행했음을 알려준다
            
//            XCTAssertGreaterThanOrEqual(lotto.bnusNo, 1)
//            XCTAssertLessThanOrEqual(lotto.bnusNo, 45)
        }
        //MARK: - (3) wait
        wait(for: [promise], timeout: 5) // 비동기 작업을 기다린다 -> 타임아웃이 지날 경우 실패로 간주
        print("💧💧💧💧💧💧💧💧💧💧💧💧")
    }
    
    
    
    func testPerformanceExample() throws {
        print(#function)
        self.measure {
        }
    }
}

/*
 /* 이전에 사용한 메서드 */
 override class func setUp() {
     print(#function)
 }
 
 override class func tearDown() {
     print(#function)
 }
 */
