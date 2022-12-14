//
//  HeaderForGridView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 29.06.2022.
//

import SwiftUI

struct Header: View {
    @Binding var numberOfCardDeck: Int
    let headers = ["Таро Висконти-Сфорца", "Таро Сола-Буска", "Марсельское таро", "Таро Райдера-Уэйта"]
    let colors = [Color.brown, .blue, .red, .yellow]
    
    var body: some View {
        HStack {
            Button (action: goToPreviousDeck) {
                Image(systemName: "arrow.backward.circle.fill")
                    .foregroundColor(colors[numberOfCardDeck])
            }
            Spacer()
            
            Text(headers[numberOfCardDeck])
                .font(.title2)
                .foregroundColor(colors[numberOfCardDeck])
            
            Spacer()
            
            Button(action: goToNextDeck) {
                Image(systemName: "arrow.forward.circle.fill")
                    .foregroundColor(colors[numberOfCardDeck])
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: 50)
        
    }
    
    func goToPreviousDeck() {
        if numberOfCardDeck != 0 {
            numberOfCardDeck -= 1
        }
    }
    
    func goToNextDeck() {
        if numberOfCardDeck != 3 {
            numberOfCardDeck += 1
        }
    }
}

struct HeaderForGridView_Previews: PreviewProvider {
    static var previews: some View {
        Header(numberOfCardDeck: .constant(0))
    }
}
