//
//  RealEstateAppTests.swift
//  RealEstateAppTests
//
//  Created by Rodrigo Borges on 07/03/22.
//

import XCTest
@testable import RealEstateApp

class RealEstateAppTests: XCTestCase {
    
    func testFormattedPrice() {
        let result = String.formattedPrice(with: 100, and: 1000)
        XCTAssertEqual(result, "Condomínio R$ 100   IPTU R$ 1000")
        
        let result2 = String.formattedPrice(with: 20000, and: 69200)
        XCTAssertEqual(result2, "Condomínio R$ 20000   IPTU R$ 69200")
        
        let result3 = String.formattedPrice(with: 850, and: 963)
        XCTAssertNotEqual(result3, "Condomínio R$ 20000   IPTU R$ 69200")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
