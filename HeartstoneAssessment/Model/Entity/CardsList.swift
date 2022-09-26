//
//  CardsList.swift
//  HeartstoneAssessment
//
//  Created by atme on 25/09/2022.
//

import Foundation

struct CardsList: Codable {
    let basic: [Card]
    let classic: [Card]
    let promo: [Card]
    let hallOfFame: [Card]
    let naxxramas: [Card]
    let goblinsVsGnomes: [Card]
    let blackrockMountain: [Card]
    let theGrandTournament: [Card]
    let theLeagueOfExplorers: [Card]
    let whispersOfTheOldGods: [Card]
    let oneNightInKarazhan: [Card]
    let meanStreetsOfGadgetzan: [Card]
    let journeyToUnGoro: [Card]
    let tavernBrawl: [Card]
    let heroSkins: [Card]
    let missions: [Card]
    let credits: [Card]
    
    var flatArray: [Card] {
        basic +
        classic +
        promo +
        hallOfFame +
        naxxramas +
        goblinsVsGnomes +
        blackrockMountain +
        theGrandTournament +
        theLeagueOfExplorers +
        whispersOfTheOldGods +
        oneNightInKarazhan +
        meanStreetsOfGadgetzan +
        journeyToUnGoro +
        tavernBrawl +
        heroSkins +
        missions +
        credits
    }
    
    enum CodingKeys: String, CodingKey {
        case basic = "Basic"
        case classic = "Classic"
        case promo = "Promo"
        case hallOfFame = "Hall of Fame"
        case naxxramas = "Naxxramas"
        case goblinsVsGnomes = "Goblins vs Gnomes"
        case blackrockMountain = "Blackrock Mountain"
        case theGrandTournament = "The Grand Tournament"
        case theLeagueOfExplorers = "The League of Explorers"
        case whispersOfTheOldGods = "Whispers of the Old Gods"
        case oneNightInKarazhan = "One Night in Karazhan"
        case meanStreetsOfGadgetzan = "Mean Streets of Gadgetzan"
        case journeyToUnGoro = "Journey to Un'Goro"
        case tavernBrawl = "Tavern Brawl"
        case heroSkins = "Hero Skins"
        case missions = "Missions"
        case credits = "Credits"
    }
}

