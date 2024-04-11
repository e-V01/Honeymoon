//
//  ContentView.swift
//  Honeymoon
//
//  Created by Y K on 11.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView(honeymoon: honeymoonData[0])
        }
    }
}

#Preview {
    ContentView()
}