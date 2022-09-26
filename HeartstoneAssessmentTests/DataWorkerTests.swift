//
//  DataWorkerTests.swift
//  HeartstoneAssessmentTests
//
//  Created by atme on 26/09/2022.
//

import XCTest
@testable import HeartstoneAssessment

final class DataWorkerTests: XCTestCase {

    let worker = DataWorker()
    
    func testCorrectFile() throws {
        let expectation = self.expectation(description: "testCorrectFile")
        let path = Bundle.main.path(forResource: "cards", ofType: "json")!

        worker.getCardsListWithPath(path: path) { result in
            switch result {
            case .success(let data):
                XCTAssertTrue(data.count > 0)
            case .failure(let error):
                XCTFail("Shouldn't be failure")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testIncorrectFileData() throws {
        let expectation = self.expectation(description: "testCorrectFile")
        let bundle = Bundle(for: DataWorkerTests.self)
        let path = bundle.path(forResource: "cards_empty", ofType: "json")!

        worker.getCardsListWithPath(path: path) { result in
            switch result {
            case .success(let data):
                XCTAssertFalse(data.count > 1)
            case .failure(let error):
                XCTFail("Shouldn't be failure")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
