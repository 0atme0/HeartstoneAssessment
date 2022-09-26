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
    @Published var datasource: CardsList?
    
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
                    self.datasource = datasource
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
}
