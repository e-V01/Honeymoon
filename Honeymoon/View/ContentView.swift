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

    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide, 
                       showInfoView: $showInfo)
            Spacer()
            CardView(honeymoon: honeymoonData[0])
            // fixed: add apdding
                .padding()
            Spacer()
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
