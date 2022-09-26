//
//  Parser.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import Foundation

typealias CardsListResult = Result<CardsList, Error>

protocol ParserProtocol {
    func getCardsList(_ data: Data) -> CardsListResult
}

class Parser {
    let decoder = JSONDecoder()

    func getCardsList(_ data: Data) -> CardsListResult {
        do {
            let result = try decoder.decode(CardsList.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
