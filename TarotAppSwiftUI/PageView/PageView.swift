//
//  PageView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 24.07.2022.
//

import SwiftUI

struct PageView: View {
    @State private var spreadIsShown = false
    var body: some View {
        if spreadIsShown {
            SpreadOfThreeCards(cards: [
                TarotCard.tarotCards[0],
                TarotCard.tarotCards[1],
                TarotCard.tarotCards[2]
            ])
        } else {
            TabView {
                PageOneView()
                PageTwoView()
                PageThreeView(spreadIsShown: $spreadIsShown)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        
        
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
