//
//  SeSACTestingTests.swift
//  SeSACTestingTests
//
//  Created by Taekwon Lee on 12/8/23.
//

import XCTest
@testable import SeSACTesting

final class SeSACTestingTests: XCTestCase {
    
    //MARK: - system under test (시스템이 테스트를 하려는 대상)
    var loginUnitTest: LoginViewController!
    
    //MARK: - setUpWithError
    override func setUpWithError() throws {
        // Test 시작 전 값 세팅
        
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        
        loginUnitTest = viewController
        loginUnitTest.loadViewIfNeeded()
    }
    
    //MARK: - setUpWithError
    override func tearDownWithError() throws {
        // 테스트 이후 초기화 (nil)
        loginUnitTest = nil
    }
    
    //MARK: - Test (1) 테스트 성공 && 성공 케이스 테스트
    func testLoginViewController_isValidEmail_ReturnTrue() throws {
        loginUnitTest.emailTextField.text = "andy@test.com"
        
        XCTAssertTrue(loginUnitTest.isValidEmail(), "없거나, 6글자 미만")
    }
    
    //MARK: - Test (2) 테스트 성공 ⭐️ BUT 실패 케이스 테스트
    func testLoginViewController_isValidEmail_ReturnFalse() throws {
        loginUnitTest.emailTextField.text = "andy.com"
        
        XCTAssertTrue(loginUnitTest.isValidEmail(), "없거나, 6글자 미만")
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
