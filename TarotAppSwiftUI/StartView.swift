//
//  StartView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 03.07.2022.
//

import SwiftUI

struct StartView: View {

    var body: some View {
        TabView() {
            ListOfCardsView()
                .tabItem {
                    Label("Список карт", systemImage: "list.bullet")
                }
            SpreadOfThreeCards(cards: TarotCard.threeRundomCards())
                .tabItem {
                    Label("Совет", systemImage: "rectangle.portrait.on.rectangle.portrait")
                }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
