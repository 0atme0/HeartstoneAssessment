//
//  DataWorker.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import Foundation

typealias CardsListResult = Result<Data, Error>

protocol DataWorkerProtocol {
    func getCardsListWithPath(path: String, completion: @escaping (CardsListResult) -> ())
}

class DataWorker: DataWorkerProtocol {
    func getCardsListWithPath(path: String, completion: @escaping (CardsListResult) -> ()) {
        DispatchQueue.global(priority: .background).async {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
