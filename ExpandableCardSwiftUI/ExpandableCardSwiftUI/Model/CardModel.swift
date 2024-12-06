//
//  File.swift
//  ExpandableCardSwiftUI
//
//  Created by Sarath kumar on 06/12/24.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let color: Color
    let title: String
    let imageName: String
    let description: String
}

// Creating Random color

extension Color {
    static func randomColor() -> Color {
        return Color(Resolved(
            red: .random(in: 0.3...1),
            green: .random(in: 0.3...1),
            blue: .random(in: 0.3...1)))
    }
}
