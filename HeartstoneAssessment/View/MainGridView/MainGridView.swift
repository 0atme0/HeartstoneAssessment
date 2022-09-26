//
//  MainGridView.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import SwiftUI

struct MainGridView: View {
    @ObservedObject var viewmodel: MainGridViewModel
    private let columns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewmodel.datasource?.basic ?? [], id: \.self) { item in
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
                .padding(.horizontal)
            }
            .navigationTitle("Hearstone cards")
        }
    }
}

struct MainGridView_Previews: PreviewProvider {
    static var previews: some View {
        MainGridView(viewmodel: MainGridViewModel())
    }
}
