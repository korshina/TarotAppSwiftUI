//
//  SpreadOfCards.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 03.07.2022.
//

import SwiftUI

struct SpreadOfThreeCards: View {
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
    
    @State private var showDetailFirst = false
    @State private var showDetailSecond = false
    @State private var showDetailThird = false
    
    @State private var pageViewIsShown = false
    
    let durationAndDelay = 0.3
    
    @State private var cards = TarotCard.threeRundomCards()
    
    let cardWidth = (UIScreen.main.bounds.width - 30) / 3
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack(spacing: 5) {
                    FlippingCard(
                        numberOfDeck: $numberOfDeck,
                        card: cards[0],
                        cardWidth: cardWidth,
                        frontDegree: frontDegreeFirst,
                        backDegree: backDegreeFirst)
                    .onTapGesture {
                        flipCardToFront(number: 0, isFlipped: isFlippedFirst)
                    }
                    .onLongPressGesture {
                        showDetailFirst.toggle()
                    }
                    FlippingCard(
                        numberOfDeck: $numberOfDeck,
                        card: cards[1],
                        cardWidth: cardWidth,
                        frontDegree: frontDegreeSecond,
                        backDegree: backDegreeSecond)
                    .onTapGesture {
                        flipCardToFront(number: 1, isFlipped: isFlippedSecond)
                    }
                    .onLongPressGesture {
                        showDetailSecond.toggle()
                    }
                    FlippingCard(numberOfDeck: $numberOfDeck, card: cards[2], cardWidth: cardWidth, frontDegree: frontDegreeThird, backDegree: backDegreeThird)
                        .onTapGesture {
                            flipCardToFront(number: 2, isFlipped: isFlippedThird)
                        }
                        .onLongPressGesture {
                            showDetailThird.toggle()
                        }
                }
                Text("Коснитесь карты 1 раз, чтобы перевернуть")
                Text("Зажмите карту, чтобы увидеть детали")
                Button(action: refreshCards) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: 30)
                        Text("Обновить карты")
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
            
            .navigationTitle("Расклад \"Совет\"")
            
            // MARK: Navigation Bar Item
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu("Изменить колоду") {
                        ChooseDeckButton(text: "Таро Висконти-Сфорца") { numberOfDeck = 0 }
                        ChooseDeckButton(text: "Таро Сола-Буска") { numberOfDeck = 1 }
                        ChooseDeckButton(text: "Марсельское таро") { numberOfDeck = 2 }
                        ChooseDeckButton(text: "Таро Райдера-Уэйта") { numberOfDeck = 3 }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        pageViewIsShown.toggle()
                    } label: {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(.blue)
                    }
                    
                }
            }
        }
        
        .sheet(isPresented: $showDetailFirst) {
            NavigationView {
                DetailTarotCard(numberOfDeck: $numberOfDeck, card: cards[0])
            }
        }
        .sheet(isPresented: $showDetailSecond) {
            NavigationView {
                DetailTarotCard(numberOfDeck: $numberOfDeck, card: cards[1])
            }
        }
        .sheet(isPresented: $showDetailThird) {
            NavigationView {
                DetailTarotCard(numberOfDeck: $numberOfDeck, card: cards[2])
            }
        }
        .sheet(isPresented: $pageViewIsShown) {
            PageView()
        }
        
    }
    
    private func flipCardToFront(number: Int, isFlipped: Bool) {
        
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                switch number {
                case 0: backDegreeFirst = 90
                case 1: backDegreeSecond = 90
                default: backDegreeThird = 90
                }
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                switch number {
                case 0: frontDegreeFirst = 0
                case 1: frontDegreeSecond = 0
                default: frontDegreeThird = 0
                }
            }
        }
//        else {
//            withAnimation(.linear(duration: durationAndDelay)) {
//                switch number {
//                case 0: frontDegreeFirst = -90
//                case 1: frontDegreeSecond = -90
//                default: frontDegreeThird = -90
//                }
//            }
//            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
//                switch number {
//                case 0: backDegreeFirst = 0
//                case 1: backDegreeSecond = 0
//                default: backDegreeThird = 0
//                }
//            }
//        }
        
        switch number {
        case 0: isFlippedFirst.toggle()
        case 1: isFlippedSecond.toggle()
        default: isFlippedThird.toggle()
        }
         
    }
    
    private func refreshCards() {
        cards = TarotCard.threeRundomCards()
        
        frontDegreeFirst = -90.0
        backDegreeFirst = 0.0
        
        frontDegreeSecond = -90.0
        backDegreeSecond = 0.0
        
        frontDegreeThird = -90.0
        backDegreeThird = 0.0
        
        isFlippedFirst.toggle()
        isFlippedSecond.toggle()
        isFlippedThird.toggle()
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

struct ChooseDeckButton: View {
    let text: String
    let completion: () -> Void
    var body: some View {
        Button(action: completion) { Text(text) }
    }
}

struct SpreadOfCards_Previews: PreviewProvider {
    static var previews: some View {
        SpreadOfThreeCards()
    }
}
