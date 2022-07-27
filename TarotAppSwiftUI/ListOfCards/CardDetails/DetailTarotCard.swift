//
//  DetailTarotCard.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 14.06.2022.
//

import SwiftUI

struct DetailTarotCard: View {
    @Binding var numberOfDeck: Int
    let card: TarotCard
    @State private var selectedPicker = 0
    
    var body: some View {
        VStack {
            Image(card.imageName[numberOfDeck])
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3 * 1.8)
            PickerView(selection: $selectedPicker, headers: ["ПРЯМОЕ", "ПЕРЕВЕРНУТОЕ"])
            ListOfAspects(card: card, selectedPicker: $selectedPicker)
                .cornerRadius(40)
        }
        .navigationTitle(card.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}



struct DetailTarotCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailTarotCard(numberOfDeck: .constant(1), card: TarotCard.tarotCards[0])
    }
}
