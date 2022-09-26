//
//  MainGridView.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import SwiftUI

struct MainGridView: View {
    @ObservedObject var viewmodel: MainGridViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainGridView_Previews: PreviewProvider {
    static var previews: some View {
        MainGridView(viewmodel: MainGridViewModel())
    }
}
