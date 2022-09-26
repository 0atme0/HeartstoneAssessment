//
//  StorageWorker.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import Foundation

protocol StorageWorkerProtocol {
    func storeFavorite(value: Bool, card: Card)
    func isFavorite(_ card: Card) -> Bool
}

class StorageWorker: StorageWorkerProtocol {
    func storeFavorite(value: Bool, card: Card) {
        UserDefaults.standard.set(value, forKey: "\(card.cardID)")
    }
    func isFavorite(_ card: Card) -> Bool {
        UserDefaults.standard.bool(forKey: "\(card.cardID)")
    }
}
