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
                ForEach(viewmodel.datasource?.basic ?? [], id: \.self) { item in
                    CellView(item: item)
                }
            }
            .padding(.horizontal)
        }
    }
}
