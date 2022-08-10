//
//  ListOfAspects.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 15.06.2022.
//

import SwiftUI

struct ListOfAspects: View {
    let card: TarotCard
    @Binding var selectedPicker: Int
    var body: some View {
        NavigationView {
            List(Aspect.allCases, id: \.rawValue) { aspect in
                if card.meaningUp.keys.contains(aspect) {
                    DisclosureGroup(aspect.rawValue) {
                        Text((selectedPicker == 0 ? card.meaningUp[aspect] : card.meaningRev[aspect]) ?? "")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Значения")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ListOfAspects_Previews: PreviewProvider {
    static var previews: some View {
        ListOfAspects(card: TarotCard.tarotCards[65], selectedPicker: .constant(0))
    }
}
