//
//  DataWorker.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import Foundation

typealias CardsListResult = Result<Data, Error>

protocol DataWorkerProtocol {
    func getCardsList() -> CardsListResult
}

class DataWorker: DataWorkerProtocol {
    func getCardsList() -> CardsListResult {
        let path = Bundle.main.path(forResource: "cards", ofType: "json")!
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
}
