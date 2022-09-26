//
//  ParserTests.swift
//  HeartstoneAssessmentTests
//
//  Created by atme on 26/09/2022.
//

import XCTest
@testable import HeartstoneAssessment

final class ParserTests: XCTestCase {

    let parser = Parser()

    func testWithEmptyData() throws {
        let expectation = self.expectation(description: "testWithEmptyData")
        parser.getCardsList(Data()) { result in
            switch result {
            case .success(let list):
                XCTFail("Shouldn't be successful")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "The data couldn’t be read because it isn’t in the correct format.")
            }
            expectation.fulfill()

        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testWithCorrectData() throws {
        let expectation = self.expectation(description: "testWithCorrectData")
        let path = Bundle.main.path(forResource: "cards", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

        parser.getCardsList(data) { result in
            switch result {
            case .success(let list):
                XCTAssertTrue(list.flatArray.count > 0)
            case .failure(let error):
                XCTFail("Shouldn't be failure")
            }
            expectation.fulfill()

        }
        waitForExpectations(timeout: 10, handler: nil)
    }


}
