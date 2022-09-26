//
//  DetailViewModel.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var card: Card
    
    init(_ card: Card) {
        self.card = card
    }
}
