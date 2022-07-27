//
//  TarotGrid.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 14.06.2022.
//

import SwiftUI

struct TarotGrid: View {
    @Binding var numberOfCardDeck: Int
    var isOpen: Bool
    let cards: [TarotCard]
    let itemWidth = (UIScreen.main.bounds.width - 30) / 3
    
    let columns = [
        GridItem(.fixed((UIScreen.main.bounds.width - 30) / 3), spacing: 10),
        GridItem(.fixed((UIScreen.main.bounds.width - 30) / 3), spacing: 10),
        GridItem(.fixed((UIScreen.main.bounds.width - 30) / 3), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(cards) { card in
                    NavigationLink(destination: DetailTarotCard(numberOfDeck: $numberOfCardDeck, card: card)) {
                        TarotCardView(numberOfDeck: $numberOfCardDeck, card: card, isOpen: isOpen, cardWidth: itemWidth)
                    }
                }
            }
        }
    }
}

struct TarotGrid_Previews: PreviewProvider {
    static var previews: some View {
        TarotGrid(numberOfCardDeck: .constant(1), isOpen: true, cards: TarotCard.tarotCards)
    }
}
