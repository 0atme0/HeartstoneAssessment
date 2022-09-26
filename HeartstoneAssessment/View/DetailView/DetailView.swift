//
//  DetailView.swift
//  HeartstoneAssessment
//
//  Created by atme on 26/09/2022.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewmodel: DetailViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: viewmodel.card.img ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image("emptyCard")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .padding(.bottom)
                HStack {
                    Image(systemName: viewmodel.isFavorite(viewmodel.card) ? "star.fill" : "star")
                        .foregroundColor(.orange)
                    Text(viewmodel.isFavorite(viewmodel.card) ? "Unmark as favourite" : "Mark as favourite")
                }
                .padding()
                .background{
                    Capsule()
                    .stroke(lineWidth: 1)}
                .contentShape(Capsule())
                .onTapGesture {
                    viewmodel.tapOnFavorite(viewmodel.card)
                }
                .padding()
                Text("Card ID: \(viewmodel.card.cardID)")
                    .padding(.horizontal)
                Text("Card Name: \(viewmodel.card.name)")
                    .padding(.horizontal)
                Text("Card Set: \(viewmodel.card.cardSet)")
                    .padding(.horizontal)
                Text("Card Type: \(viewmodel.card.type)")
                    .padding(.horizontal)
                Text(viewmodel.card.text ?? "")
                    .font(.caption)
                    .padding(.horizontal)
            }
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewmodel: DetailViewModel(Card(cardID: "test", name: "test", cardSet: "test", type: "test", text: "test", playerClass: "test", locale: "test", mechanics: [], faction: "test", rarity: "test", health: 0, collectible: false, img: nil, imgGold: nil, attack: nil, race: "test", cost: 0, flavor: "test", artist: "test", howToGet: "test", howToGetGold: "test", durability: 0, elite: nil, multiClassGroup: "test", classes: [])))
    }
}
