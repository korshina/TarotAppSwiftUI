//
//  SpreadOfCards.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 03.07.2022.
//

import SwiftUI

struct SpreadOfThreeCards: View {
    @State private var cardsIsOpen = false
    @State private var pickerIsOpen = false
    @State private var numberOfDeck = 1
    
    @State private var frontDegreeFirst = -90.0
    @State private var backDegreeFirst = 0.0
    
    @State private var frontDegreeSecond = -90.0
    @State private var backDegreeSecond = 0.0
    
    @State private var frontDegreeThird = -90.0
    @State private var backDegreeThird = 0.0
    
    @State private var isFlippedFirst = true
    @State private var isFlippedSecond = true
    @State private var isFlippedThird = true
    
    let durationAndDelay = 0.3
    
    let cards: [TarotCard]
    let cardWidth = (UIScreen.main.bounds.width - 30) / 3
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button {
                withAnimation {
                    pickerIsOpen.toggle()
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 170, height: 30)
                        .foregroundColor(.blue)
                    Text("Выберите колоду")
                        .font(.body)
                        .foregroundColor(.white)
                }
                
            }
            
            if pickerIsOpen {
                PickerWheel(selection: $numberOfDeck)
            }
            HStack(spacing: 5) {
                FlippingCard(numberOfDeck: $numberOfDeck, card: cards[0], cardWidth: cardWidth, frontDegree: frontDegreeFirst, backDegree: backDegreeFirst)
                    .onTapGesture {
                        flipCard(number: 1, isFlipped: isFlippedFirst)
                    }
                FlippingCard(numberOfDeck: $numberOfDeck, card: cards[1], cardWidth: cardWidth, frontDegree: frontDegreeSecond, backDegree: backDegreeSecond)
                    .onTapGesture {
                        flipCard(number: 2, isFlipped: isFlippedSecond)
                    }
                FlippingCard(numberOfDeck: $numberOfDeck, card: cards[2], cardWidth: cardWidth, frontDegree: frontDegreeThird, backDegree: backDegreeThird)
                    .onTapGesture {
                        flipCard(number: 3, isFlipped: isFlippedThird)
                    }
            }
            Spacer()
        }
        .padding()
        
    }
    
    private func flipCard(number: Int, isFlipped: Bool) {
        switch number {
        case 1: isFlippedFirst.toggle()
        case 2: isFlippedSecond.toggle()
        default: isFlippedThird.toggle()
        }
        
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                switch number {
                case 1: backDegreeFirst = 90
                case 2: backDegreeSecond = 90
                default: backDegreeThird = 90
                }
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                switch number {
                case 1: frontDegreeFirst = 0
                case 2: frontDegreeSecond = 0
                default: frontDegreeThird = 0
                }
            }
        }
        //        } else {
        //            withAnimation(.linear(duration: durationAndDelay)) {
        //                switch number {
        //                case 1: frontDegreeFirst = -90
        //                case 2: frontDegreeSecond = -90
        //                default: frontDegreeThird = -90
        //                }
        //            }
        //            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
        //                switch number {
        //                case 1: backDegreeFirst = 0
        //                case 2: backDegreeSecond = 0
        //                default: backDegreeThird = 0
        //                }
        //            }
        //        }
    }
}

struct FlippingCard: View {
    @Binding var numberOfDeck: Int
    let card: TarotCard
    let cardWidth: CGFloat
    let frontDegree: Double
    let backDegree: Double
    
    
    var body: some View {
        ZStack {
            TarotCardView(numberOfDeck: $numberOfDeck, card: card, isOpen: true, cardWidth: cardWidth)
                .rotation3DEffect(Angle(degrees: frontDegree), axis: (x: 0, y: 1, z: 0))
            TarotCardView(numberOfDeck: $numberOfDeck, card: card, isOpen: false, cardWidth: cardWidth)
                .rotation3DEffect(Angle(degrees: backDegree), axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct PickerWheel: View {
    @Binding var selection: Int
    
    var body: some View {
        Picker("Выбери колоду", selection: $selection) {
            Text("Таро Висконсти-Сфорца").tag(0)
            Text("Таро Сола-Буска").tag(1)
            Text("Марсельское таро").tag(2)
            Text("Таро Райдера-Уэйта").tag(3)
        }
        .pickerStyle(.inline)
    }
}



struct SpreadOfCards_Previews: PreviewProvider {
    static var previews: some View {
        SpreadOfThreeCards(cards: TarotCard.threeRundomCards())
    }
}
