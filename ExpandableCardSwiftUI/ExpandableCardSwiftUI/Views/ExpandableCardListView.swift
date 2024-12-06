//
//  ExpandableCardListView.swift
//  ExpandableCardSwiftUI
//
//  Created by Sarath kumar on 06/12/24.
//

import SwiftUI

struct ExpandableCardListView: View {
    @Namespace private var animationNameSpace
    @State private var selectedCardId: UUID?
    
    private let cards: [Card] = (1...20).map { index in
        Card(
            color: .randomColor(),
            title: "Title \(index)",
            imageName: "img\(index % 5)",
            description: "This is your detailed description of Title \(index), just read and enjoy..."
        )
    }
    
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(cards) { card in
                    if selectedCardId == card.id {
                        // Expanded Card View
                        ExpandedCardView(card: card, animation: animationNameSpace) {
                            toggleExpansion(of: nil)
                        }
                    } else {
                        // Collapsed card View
                        CollapsedCardView(card: card, animation: animationNameSpace) {
                            toggleExpansion(of: card.id)
                        }
                        
                    }
                }
            }
        }
    }
    
    private func toggleExpansion(of cardId: UUID?) {
        selectedCardId = cardId
    }
}

#Preview {
    ExpandableCardListView()
}
