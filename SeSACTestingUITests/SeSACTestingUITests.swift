//
//  SeSACTestingUITests.swift
//  SeSACTestingUITests
//
//  Created by Taekwon Lee on 12/8/23.
//

import XCTest

final class SeSACTestingUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let idTextField = app.textFields["🪪 ID"]
        idTextField.tap()
        idTextField.typeText("1234567")
        
        let emailTextField = app.textFields["📧 Email"]
        emailTextField.tap()
        emailTextField.typeText("abcd@12.co")
        
        
        let passwordTextField = app.textFields["🗝️ Password"]
        passwordTextField.tap()
        passwordTextField.typeText("123#@#")
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
