//
//  Parser.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import Foundation

typealias CardsListParserResult = Result<CardsList, Error>

protocol ParserProtocol {
    func getCardsList(_ data: Data, completion: @escaping (CardsListParserResult) -> ())
}

class Parser: ParserProtocol {
    private let decoder = JSONDecoder()
    
    func getCardsList(_ data: Data, completion: @escaping (CardsListParserResult) -> ()) {
        DispatchQueue.global(priority: .background).async {
            do {
                let result = try self.decoder.decode(CardsList.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
