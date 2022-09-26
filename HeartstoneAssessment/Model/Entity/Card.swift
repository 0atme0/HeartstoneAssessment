//
//  Card.swift
//  HeartstoneAssessment
//
//  Created by atme on 25/09/2022.
//

import Foundation

struct Card: Codable, Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.cardID == rhs.cardID
    }
    var hashValue: Int {
        return cardID.hashValue
    }
    let cardID, name: String
    let cardSet: String
    let type: String
    let text: String?
    let playerClass: String?
    let locale: String
    let mechanics: [Mechanic]?
    let faction: String?
    let rarity: String?
    let health: Int?
    let collectible: Bool?
    let img: String?
    let imgGold: String?
    let attack: Int?
    let race: String?
    let cost: Int?
    let flavor, artist, howToGet, howToGetGold: String?
    let durability: Int?
    let elite: Bool?
    let multiClassGroup: String?
    let classes: [String]?
    
    enum CodingKeys: String, CodingKey {
        case cardID = "cardId"
        case name, cardSet, type, text, playerClass, locale, mechanics, faction, rarity, health, collectible, img, imgGold, attack, race, cost, flavor, artist, howToGet, howToGetGold, durability, elite, multiClassGroup, classes
    }
}
