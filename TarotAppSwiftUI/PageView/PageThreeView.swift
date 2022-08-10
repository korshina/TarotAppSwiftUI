//
//  PageThreeView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 24.07.2022.
//

import SwiftUI

struct PageThreeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack(spacing: 30) {
                Spacer()
                RectangleView(text: "1")
                RectangleView(text: "2")
                RectangleView(text: "3")
                Spacer()
            }
            Group {
                Text("Позиция 1 - проблема, сложная ситуация, задача, которую надо решить.")
                Text("Позиция 2 - совет, что делать, как себя вести, что поможет решить задачу.")
                Text("Позиция 3 - к чему придешь, если следовать рекомендации 2.")
            }
            .font(.title2)
        }
        .padding()
    }
}

struct PageThreeView_Previews: PreviewProvider {
    static var previews: some View {
        PageThreeView()
    }
}
