//
//  NetworkMockTestCase.swift
//  SeSACTestingTests
//
//  Created by Taekwon Lee on 12/13/23.
//

import XCTest
@testable import SeSACTesting

final class NetworkMockTestCase: XCTestCase {
    
    var sut: NetworkProvider!
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testExample() throws {
        
        sut.fetchLotto(number: 1000) { lotto in
            <#code#>
        }
        
    }
    
    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }
    
}
