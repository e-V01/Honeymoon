//
//  ContentView.swift
//  Honeymoon
//
//  Created by Y K on 11.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    
    // MARK: - Card views
    var cardViews: [CardView] = {
        var views = [CardView]()
        for i in 0..<2  {
            views.append(CardView(honeymoon: honeymoonData[i]))
        }
        return views
    }()
    
    // MARK: - Top Card (if card is top most one or not)
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }

    
    var body: some View {
        VStack {
            // MARK: - Header
            HeaderView(showGuideView: $showGuide,
                       showInfoView: $showInfo)
            Spacer()
            
            // MARK: - Cards
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                }
            }
            .padding(.horizontal)
            Spacer()
            
            // MARK: - Footer
            FooterView(showBookingAlert: $showAlert)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success"),
                  message: Text("Wish you a splendid time"),
                  dismissButton: .default(Text("Happy Honeymoon")))
        }
    }
}

#Preview {
    ContentView()
}
