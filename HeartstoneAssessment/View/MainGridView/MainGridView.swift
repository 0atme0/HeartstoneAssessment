//
//  MainGridView.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import SwiftUI

struct MainGridView: View {
    @ObservedObject var viewmodel: MainGridViewModel
    internal let columns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        NavigationView {
            ZStack {
                listView
                    .navigationTitle("Heartstone cards")
                if viewmodel.showingLoader {
                    ProgressView()
                }
                if let errorText = viewmodel.showingError {
                    errorView(errorText)
                }
            }
        }
    }
}

struct MainGridView_Previews: PreviewProvider {
    static var previews: some View {
        MainGridView(viewmodel: MainGridViewModel())
    }
}
