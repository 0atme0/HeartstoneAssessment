//
//  MainGridViewModel.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import SwiftUI

class MainGridViewModel: ObservableObject {
    
    private var worker: DataWorkerProtocol
    private var parser: ParserProtocol
    @Published var showingError: String?
    @Published var showingLoader: Bool = false
    @Published var datasource: [Card] = []
    
    init(worker: DataWorkerProtocol = DataWorker(), parser: ParserProtocol = Parser()) {
        self.worker = worker
        self.parser = parser
        loadData()
    }
    //MARK: Public methods
    func loadData() {
        showingLoader = true
        self.worker.getCardsList { result in
            self.showingLoader = false
            switch result {
            case .success(let data):
                self.parseData(data) { datasource in
                    self.datasource = self.filterCards(datasource)
                }
            case .failure(let error):
                self.showingError = error.localizedDescription
            }
        }
    }
    //MARK: Private methods
    func parseData(_ data: Data, completion: @escaping (CardsList?) -> ()) {
        showingLoader = true
        parser.getCardsList(data) { result in
            self.showingLoader = false
            switch result {
            case .success(let list):
                completion(list)
            case .failure(let error):
                self.showingError = error.localizedDescription
                completion(nil)
            }
        }
    }
    //Filter cards as it was mentioned in assessment: Hsiao is especially interested in the app showing Legendary cards with the Deathrattle Mechanic
    func filterCards(_ datasource: CardsList?) -> [Card] {
        datasource?.flatArray.filter{$0.rarity == "Legendary" && ($0.mechanics?.map{$0.name}.contains("Deathrattle") ?? false)} ?? []
    }
}
