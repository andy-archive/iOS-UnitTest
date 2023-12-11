//
//  LoginTestCase.swift
//  SeSACTestingTests
//
//  Created by Taekwon Lee on 12/11/23.
//

import XCTest
@testable import SeSACTesting

final class LoginTestCase: XCTestCase {
    
    var sut: Validator!
    let validUserData = User(email: "andy@test.com", password: "123456", check: "123456")
    
    override func setUpWithError() throws {
        sut = Validator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testValidator_EmailValidation_ReturnTrue() throws {
        let emailValidation = sut.isValidEmail(email: validUserData.email)
        XCTAssertTrue(emailValidation, "check your email again")
    }
    
    func testPerformanceExample() throws {
        self.measure { }
    }
}
