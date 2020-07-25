//
//  GBShopTests.swift
//  GBShopTests
//
//  Created by Maksim Romanov on 16.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class GBShopTests: XCTestCase {
    var errorParser: ErrorParserStub!
    let expectation = XCTestExpectation(description: "Download failed url")
    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStub()
    }
    
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
    override func tearDown() {
        super.tearDown()
        errorParser = nil
    }
    /*
    func testShouldDownloadAndParse() {
        AF.request("https://").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<PostStub>) in
            switch response.result {
            case .failure(_):
                XCTFail()
            case .success(_):
                XCTAssert(true)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }*/
    
    func testLogin() {
        let auth = Auth(errorParser: errorParser, session: Session())
        auth.login(userName: "test", password: "123") { [weak self] (response: AFDataResponse<LoginResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(let data):
                    //print(data)
                    //XCTAssert(true)
                    XCTAssertEqual(data.result, 1)
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
