//
//  MainGridView+Cell.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import SwiftUI

extension MainGridView {
    struct CellView: View {
        @State var item : Card
        var body: some View {
            VStack {
                AsyncImage(url: URL(string: item.img ?? ""), scale: 2) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                Text(item.cardID)
            }
        }
    }
}
