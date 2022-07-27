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
                DisclosureGroup(aspect.rawValue) {
                    Text((selectedPicker == 0 ? card.meaningUp[aspect] : card.meaningRev[aspect]) ?? "")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding(.horizontal)
            }
            .navigationTitle("Значения")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ListOfAspects_Previews: PreviewProvider {
    static var previews: some View {
        ListOfAspects(card: TarotCard.tarotCards[0], selectedPicker: .constant(0))
    }
}
