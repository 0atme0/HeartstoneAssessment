//
//  MainGridViewModelTests.swift
//  HeartstoneAssessmentTests
//
//  Created by atme on 26/09/2022.
//

import XCTest
@testable import HeartstoneAssessment

final class MainGridViewModelTests: XCTestCase {

    var viewmodel = MainGridViewModel()
    
    //MARK: Filter method
    func testFilterCardsWithEmptyDatasource() throws {
        let value = viewmodel.filterCards(nil)
        XCTAssertTrue(value.count == 0)
    }
    func testFilterCardsWithoutRequiredCard() throws {
        let card = Card(cardID: "test", name: "test", cardSet: "test", type: "test", text: "test", playerClass: "test", locale: "test", mechanics: [], faction: "test", rarity: "test", health: 0, collectible: false, img: nil, imgGold: nil, attack: nil, race: "test", cost: 0, flavor: "test", artist: "test", howToGet: "test", howToGetGold: "test", durability: 0, elite: nil, multiClassGroup: "test", classes: [])
        let cardList = CardsList(basic: [], classic: [], promo: [], hallOfFame: [], naxxramas: [], goblinsVsGnomes: [], blackrockMountain: [], theGrandTournament: [], theLeagueOfExplorers: [], whispersOfTheOldGods: [], oneNightInKarazhan: [], meanStreetsOfGadgetzan: [], journeyToUnGoro: [], tavernBrawl: [], heroSkins: [], missions: [], credits: [card])
        
        let value = viewmodel.filterCards(cardList)
        XCTAssertTrue(value.count == 0)
    }
    func testFilterCardsWithRequiredCard() throws {
        let card = Card(cardID: "test", name: "test", cardSet: "test", type: "test", text: "test", playerClass: "test", locale: "test", mechanics: [Mechanic(name: "Deathrattle")], faction: "test", rarity: "Legendary", health: 0, collectible: false, img: nil, imgGold: nil, attack: nil, race: "test", cost: 0, flavor: "test", artist: "test", howToGet: "test", howToGetGold: "test", durability: 0, elite: nil, multiClassGroup: "test", classes: [])
        let cardList = CardsList(basic: [], classic: [], promo: [], hallOfFame: [], naxxramas: [], goblinsVsGnomes: [], blackrockMountain: [], theGrandTournament: [], theLeagueOfExplorers: [], whispersOfTheOldGods: [], oneNightInKarazhan: [], meanStreetsOfGadgetzan: [], journeyToUnGoro: [], tavernBrawl: [], heroSkins: [], missions: [], credits: [card])
        
        let value = viewmodel.filterCards(cardList)
        XCTAssertTrue(value.count == 1)
    }
    
    //MARK: Parse method
    func testParseDataWithEmptyData() throws {
        let expectation = self.expectation(description: "testParseDataWithEmptyData")
        let data = Data()
        viewmodel.parseData(data) { list in
            XCTAssertNil(list)
            XCTAssertNotNil(self.viewmodel.showingError)
            XCTAssertEqual(self.viewmodel.showingError, "The data couldn’t be read because it isn’t in the correct format.")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    func testParseDataWithRealData() throws {
        let expectation = self.expectation(description: "testParseDataWithRealData")
        let path = Bundle.main.path(forResource: "cards", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        viewmodel.parseData(data) { list in
            XCTAssertNotNil(list)
            XCTAssertNil(self.viewmodel.showingError)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    //MARK: Load method
    func testLoadData() throws {
        let expectation = self.expectation(description: "testLoadData")
        viewmodel.loadData { cards in
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(viewmodel.datasource.count > 0)
    }

}
