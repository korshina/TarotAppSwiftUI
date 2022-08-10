//
//  PageView.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 24.07.2022.
//

import SwiftUI

struct PageView: View {
    
    var body: some View {
        TabView {
            PageOneView()
            PageTwoView()
            PageThreeView()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
