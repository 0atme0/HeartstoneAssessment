//
//  DetailViewModel.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var card: Card
    private var storage: StorageWorkerProtocol
    
    init(_ card: Card, storage: StorageWorkerProtocol = StorageWorker()) {
        self.card = card
        self.storage = storage
    }
    
    //MARK: Public methods
    func isFavorite(_ card: Card) -> Bool {
        storage.isFavorite(card)
    }
    func tapOnFavorite(_ card: Card) {
        let currentValue = storage.isFavorite(card)
        storage.storeFavorite(value: !currentValue, card: card)
        updateList()
    }
    func updateList() {
        self.objectWillChange.send()
    }
}
