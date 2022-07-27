//
//  BeforeSpreadView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 24.07.2022.
//

import SwiftUI

struct PageOneView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text("Рекомендуем использовать в гадательной практике настоящие карты!")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Text("Смахните \(Image(systemName: "arrow.right.circle")) чтобы смотреть дальше")
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct PageOneView_Previews: PreviewProvider {
    static var previews: some View {
        PageOneView()
    }
}
