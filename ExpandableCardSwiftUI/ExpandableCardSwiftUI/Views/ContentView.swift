//
//  ContentView.swift
//  ExpandableCardSwiftUI
//
//  Created by Sarath kumar on 06/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            
            ExpandableCardListView()
        }
    }
}

#Preview {
    ContentView()
}
