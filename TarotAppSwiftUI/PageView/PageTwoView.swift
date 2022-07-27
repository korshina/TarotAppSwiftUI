//
//  PageTwoView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 24.07.2022.
//

import SwiftUI

struct PageTwoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Расклад \"Совет\" делается, чтобы найти выход из проблемной ситуации и получить совет. Из колоды достается 3 карты.")
                .font(.title2)
            HStack(spacing: 30) {
                Spacer()
                RectangleView(text: "1")
                RectangleView(text: "2")
                RectangleView(text: "3")
                Spacer()
            }
            HStack {
                Spacer()
                Text("Смахните \(Image(systemName: "arrow.right.circle")) чтобы смотреть дальше")
                    .foregroundColor(.blue)
                Spacer()
            }
        }
        .padding()
        
    }
}

struct RectangleView: View {
    let text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 4)
                .frame(width: 50, height: 100)
            Text(text)
                .foregroundColor(.black)
                .font(.title)
        }
        
    }
}

struct PageTwoView_Previews: PreviewProvider {
    static var previews: some View {
        PageTwoView()
    }
}
