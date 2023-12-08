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

    //MARK: - (Test 1) tap & type TextFields
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["idTextField"].tap()
        app.textFields["idTextField"].typeText("12345678")
        
        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("abcd@123.co")
        
        app.textFields["passwordTextField"].tap()
        app.textFields["passwordTextField"].typeText("12345678")
    }
    
    //MARK: - (Test 2) loginButton tap
    func testExample2() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["idTextField"].tap()
        app.textFields["idTextField"].typeText("2468")
        
        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("test222@abc.co")
        
        app.textFields["passwordTextField"].tap()
        app.textFields["passwordTextField"].typeText("12345678")
        
        app.buttons["loginButton"].tap()
    }
    
    //MARK: - (Test 3) XCTAssertTrue
    func testExample3() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["idTextField"].tap()
        app.textFields["idTextField"].typeText("2468")
        
        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("test222@abc.co")
        
        app.textFields["passwordTextField"].tap()
        app.textFields["passwordTextField"].typeText("12345678")
        
        app.buttons["loginButton"].tap()
        
        /* 📌 XCTAssertTrue -> ERROR with message */
        XCTAssertTrue(app.staticTexts["Next Page"].exists, "cannot find next page")
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
