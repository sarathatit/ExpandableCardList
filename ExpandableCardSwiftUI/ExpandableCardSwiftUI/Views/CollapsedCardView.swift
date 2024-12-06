//
//  CollapsedCardView.swift
//  ExpandableCardSwiftUI
//
//  Created by Sarath kumar on 06/12/24.
//

import SwiftUI

struct CollapsedCardView: View {
    let card: Card
    let animation: Namespace.ID
    let onTap: () -> Void
    
    var body: some View {
        HStack(spacing: 5) {
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .matchedGeometryEffect(id: "img\(card.id)", in: animation)
            Spacer()
            Text(card.title)
                .font(.title)
                .bold()
                .matchedGeometryEffect(id: "title\(card.id)", in: animation)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(card.color)
            .matchedGeometryEffect(id: "backgrround\(card.id)", in: animation))
        .onTapGesture {
            onTap()
        }
        .padding(.horizontal)
    }
}

#Preview {
    @Namespace var animationNamespace
    return  CollapsedCardView(
            card: Card(
                color: .yellow,
                title: "Title",
                imageName: "img1",
                description: "This is your detailed description of Title"
            ),
            animation: animationNamespace, // Provide a Namespace.ID
            onTap: {} // Provide an empty closure
        )
}
