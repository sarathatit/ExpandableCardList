//
//  ExpandedCardView.swift
//  ExpandableCardSwiftUI
//
//  Created by Sarath kumar on 06/12/24.
//

import SwiftUI

struct ExpandedCardView: View {
    let card: Card
    let animation: Namespace.ID
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(.img1)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 15, x: 0, y: 0)
                    .matchedGeometryEffect(id: "img\(card.id)", in: animation)
                
                Button(action: {
                    onTap()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                })
            }
            
            Text(card.title)
                .font(.title)
                .bold()
                .foregroundStyle(.black)
                .padding(.horizontal)
                .matchedGeometryEffect(id: "Title\(card.id)", in: animation)
            
            Text(card.description)
                .font(.body)
                .foregroundStyle(.black)
                .padding([.horizontal, .bottom])
                .matchedGeometryEffect(id: "description\(card.id)", in: animation)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(card.color)
                .matchedGeometryEffect(id: "background\(card.id)", in: animation))
               
        .onTapGesture {
                    
        }
    }
}

#Preview {
    @Namespace var animationNamespace
    return  ExpandedCardView(
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
