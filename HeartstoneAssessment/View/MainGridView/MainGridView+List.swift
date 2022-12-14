//
//  MainGridView+List.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import SwiftUI

extension MainGridView {
    var listView: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewmodel.datasource, id: \.self) { item in
                    NavigationLink(destination: DetailView(viewmodel: DetailViewModel(item))) {
                        CellView(item: item)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
