//
//  MainGridView+ErrorView.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import SwiftUI

extension MainGridView {
    func errorView(_ text: String) -> some View {
        VStack{
            Spacer()
            Text(text)
        }
    }
}
