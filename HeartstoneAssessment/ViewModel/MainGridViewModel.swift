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
    @Published var datasource: CardsList?
    
    init(worker: DataWorkerProtocol = DataWorker(), parser: ParserProtocol = Parser()) {
        self.worker = worker
        self.parser = parser
        loadData()
    }
    //MARK: Public methods
    func loadData() {
        switch self.worker.getCardsList() {
        case .success(let data):
            print(data.count)
            datasource = parseData(data)
        case .failure(let error):
            showingError = error.localizedDescription
        }
    }
    //MARK: Private methods
    func parseData(_ data: Data) -> CardsList? {
        switch parser.getCardsList(data) {
        case .success(let list):
            print(list.basic.count)
            return list
        case .failure(let error):
            showingError = error.localizedDescription
            return nil
        }
    }
}
