//
//  PickerView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 29.06.2022.
//

import SwiftUI

struct PickerView: View {
    @Binding var selection: Int
    let headers: [String]
    var body: some View {
        Picker("Выбери способ отображения", selection: $selection) {
            ForEach(headers.indices, id: \.self) { index in
                Text(headers[index]).tag(index)
            }
        }
        .pickerStyle(.segmented)

    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(selection: .constant(0), headers: ["Список", "Карточки"])
    }
}
