//
//  TarotCardView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 13.06.2022.
//

import SwiftUI

struct TarotCardView: View {
    @Binding var numberOfDeck: Int
    let card: TarotCard
    var isOpen: Bool
    let cardWidth: CGFloat
    
    var body: some View {
        VStack {
//            if isOpen {
//                Text(card.name)
//                    .font(.subheadline)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color(red: 0.709, green: 0.63, blue: 0.351))
//                    .multilineTextAlignment(.center)
//                    .frame(width: cardWidth + 5, height: 40, alignment: .center)
//            }
            ImageView(imageName: isOpen ?
                      card.imageName[numberOfDeck]
                      : card.imageBack[numberOfDeck],
                      width: cardWidth)
            .rotationEffect(card.isReversed ? Angle(degrees: 180) : Angle(degrees: 0))
                
    
        }
    }
}

struct ImageView: View {
    let imageName: String
    let width: CGFloat
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: width * 1.8)
    }
}

struct TarotCardView_Previews: PreviewProvider {
    static var previews: some View {
        TarotCardView(numberOfDeck: .constant(3), card: TarotCard.tarotCards[10], isOpen: true, cardWidth: CGFloat(80))
    }
}
