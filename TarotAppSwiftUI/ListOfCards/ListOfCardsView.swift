//
//  ContentView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 13.06.2022.
//

import SwiftUI

struct ListOfCardsView: View {
    @State private var selectedPicker = 0
    @State private var searchText = ""
    @State private var numberOfCardDeck = 0
    
    let cards = TarotCard.tarotCards
  
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Header(numberOfCardDeck: $numberOfCardDeck)
                PickerView(selection: $selectedPicker, headers: ["Список", "Карточки"])
                if selectedPicker == 0 {
                    ListView(
                        numberOfCardDeck: $numberOfCardDeck,
                        cards: searchResults)
                } else {
                    Spacer(minLength: 10)
                    TarotGrid(numberOfCardDeck: $numberOfCardDeck, isOpen: true, cards: searchResults)
                }
                
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer,
                prompt: "Введите название карты")
                .navigationTitle("Карты Таро")
                
        }
        
    }
    
    var searchResults: [TarotCard] {
        if searchText.isEmpty {
            return cards
        } else {
            return cards.filter { $0.name.contains(searchText) }
        }
    }
}

struct ListOfCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCardsView()
    }
}
