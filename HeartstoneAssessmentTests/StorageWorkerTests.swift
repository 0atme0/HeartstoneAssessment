//
//  StorageWorkerTests.swift
//  HeartstoneAssessmentTests
//
//  Created by atme on 26/09/2022.
//

import XCTest
@testable import HeartstoneAssessment

final class StorageWorkerTests: XCTestCase {

    var storage = StorageWorker()

    override func setUpWithError() throws {
        storage = StorageWorker()
    }
    
    func testIsFavoriteWrongCard() throws {
        let card = Card(cardID: "test", name: "test", cardSet: "test", type: "test", text: "test", playerClass: "test", locale: "test", mechanics: [], faction: "test", rarity: "test", health: 0, collectible: false, img: nil, imgGold: nil, attack: nil, race: "test", cost: 0, flavor: "test", artist: "test", howToGet: "test", howToGetGold: "test", durability: 0, elite: nil, multiClassGroup: "test", classes: [])
        let isFavorite = storage.isFavorite(card)
        XCTAssertFalse(isFavorite)
    }
    func testStoreFavorite() throws {
        let card = Card(cardID: "test", name: "test", cardSet: "test", type: "test", text: "test", playerClass: "test", locale: "test", mechanics: [], faction: "test", rarity: "test", health: 0, collectible: false, img: nil, imgGold: nil, attack: nil, race: "test", cost: 0, flavor: "test", artist: "test", howToGet: "test", howToGetGold: "test", durability: 0, elite: nil, multiClassGroup: "test", classes: [])
        
        storage.storeFavorite(value: true, card: card)
        var isFavorite = storage.isFavorite(card)
        XCTAssertTrue(isFavorite)
        
        storage.storeFavorite(value: false, card: card)
        isFavorite = storage.isFavorite(card)
        XCTAssertFalse(isFavorite)
    }

}
