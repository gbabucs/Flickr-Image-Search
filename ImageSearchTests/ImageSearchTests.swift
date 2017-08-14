//
//  ImageSearchTests.swift
//  ImageSearchTests
//
//  Created by Babu Gangatharan on 7/25/17.
//  Copyright © 2017 Babu Gangatharan. All rights reserved.
//

import XCTest
@testable import ImageSearch

class ImageSearchTests: XCTestCase {
    
    let searchHistoryController = SearchHistoryViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // searchHistoryController.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let photo = Photo(id: "23451156376", secret: "8983a8ebc7", server: "578", farm: 1, title: "Merry Christmas!")
        
        XCTAssertEqual(photo.id, "23451156376")
        XCTAssertEqual(photo.secret, "8983a8ebc7")
        XCTAssertEqual(photo.server, "578")
        XCTAssertEqual(photo.farm, 1)
        XCTAssertEqual(photo.title, "Merry Christmas!")
        
    }
    
    func testTableViewOutlet() {
        XCTAssertNil(searchHistoryController.tableView)
    }
    
    func testPhotoNotEqual() {
        let photo = Photo(id: "23451156376", secret: "8983a8ebc7", server: "578", farm: 1, title: "Merry Christmas!")
        
        XCTAssertNotEqual(photo.id, "1")
        XCTAssertNotEqual(photo.secret, "")
        XCTAssertNotEqual(photo.server, "434")
        XCTAssertNotEqual(photo.farm, 3)
        XCTAssertNotEqual(photo.title, "Merry Chriistmas!")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
