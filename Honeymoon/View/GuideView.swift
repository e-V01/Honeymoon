//
//  GuideView.swift
//  Honeymoon
//
//  Created by Y K on 11.04.2024.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.presentationMode) var pM
    // dismiss sheet view
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundStyle(Color.pink)
                
                Text("Discover and pick the perfect destination. \n HoneyMoon")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(title: "Like", 
                                   subtitle: "Swipe right",
                                   description: "Your chosen destination",
                                   icon: "heart.circle")
                    GuideComponent(title: "Dismiss", 
                                   subtitle: "Swipe left",
                                   description: "Skip this place?",
                                   icon: "xmark.circle")
                    GuideComponent(title: "Book",
                                   subtitle: "Tap me",
                                   description: "Selected honeymoon resort",
                                   icon: "checkmark.circle")
                }
                Spacer(minLength: 10)
                
                Button {
                    self.pM.wrappedValue.dismiss()
                }label: {
                    Text("Continue".uppercased())
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Capsule().fill(Color.pink))
                        .foregroundStyle(Color.white)
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)

        }
    }
}

#Preview {
    GuideView()
}
