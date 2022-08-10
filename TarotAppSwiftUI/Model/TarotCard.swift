//
//  TarotCard.swift
//  TarotAppSwiftUI
//
//  Created by Anastasiia Korshina on 13.06.2022.
//

import Foundation
import SwiftUI

struct TarotCard: Identifiable {
    let id: String
    let name: String
    let imageName: [String]
    var isReversed: Bool
    let imageBack = ["0_back", "1_back", "2_back", "3_back"]
    let isMajor: Bool
    let suit: Suit?
    let meaningUp: [Aspect: String]
    let meaningRev: [Aspect: String]
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

enum Suit: String {
    case wands = "Жезлы"
    case swords = "Мечи"
    case cups = "Кубки"
    case pentacles = "Пентакли"
}

enum Aspect: String, CaseIterable {
    case general = "Общее значение"
    case character = "Характеристика человека"
    case specialRoles = "Типы людей и особые роли"
    case events = "События"
    case business = "Бизнес, работа"
    case occupation = "Род занятий"
    case relations = "Отношения"
    case psyho = "Психологическая характеристика"
    case advice = "Совет"
    case warning = "Предостережение"
    case scene = "Место действия, события, ситуации"
}

