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
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    
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
    
    //MARK: - Drag States
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        var isPresenting: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }

    
    var body: some View {
        VStack {
            // MARK: - Header
            HeaderView(showGuideView: $showGuide,
                       showInfoView: $showInfo)
            .opacity(dragState.isDragging ? 0.0 : 1.0)
            .animation(.default)
            
            Spacer()
            
            // MARK: - Cards
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay{
                            ZStack {
                                //Xmark
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                // Hard symbol
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        }
                        .offset(x: self.isTopCard(cardView: cardView) ?
                                    self.dragState.translation.width : 0,
                                y: self.isTopCard(cardView: cardView) ?
                                self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, state, translation) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                        )
                }
            }
            .padding(.horizontal)
            Spacer()
            
            // MARK: - Footer
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
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
