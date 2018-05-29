//
//  ExamenTests.swift
//  ExamenTests
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import XCTest
@testable import Examen

class ExamenTests: XCTestCase {
    var textSearch : String!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        textSearch = "Objective-c"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        textSearch=nil
        super.tearDown()
    }
    
    func testSearch() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let promise = expectation(description: "Servicio disponible")
        SearchRequester.searchVideo(for: textSearch, callback: { error, result in
            if error == nil{
                promise.fulfill()
            }else{
                XCTFail("Error al consultar el servicio")
            }
        })
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
