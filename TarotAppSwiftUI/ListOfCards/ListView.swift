//
//  ListView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 29.06.2022.
//

import SwiftUI

struct ListView: View {
    @Binding var numberOfCardDeck: Int
    let cards: [TarotCard]
    var body: some View {
        List(cards) { card in
            NavigationLink(destination: DetailTarotCard(numberOfDeck: $numberOfCardDeck, card: card)) {
                HStack(spacing: 20) {
                    ImageView(imageName: card.imageName[numberOfCardDeck], width: 80)
                    Text(card.name)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(numberOfCardDeck: .constant(1), cards: TarotCard.tarotCards)
    }
}
