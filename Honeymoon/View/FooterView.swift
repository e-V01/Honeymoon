//
//  FooterView.swift
//  Honeymoon
//
//  Created by Y K on 11.04.2024.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            Image(systemName: "xmarl.circle")
                .font(.system(size: 42, weight: .light))
            Spacer()
            Button {
                print("Booked")
            } label: {
                Text("Book destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .tint(Color.pink)
                    .background(Capsule()
                        .stroke(Color.pink, lineWidth: 2))
                                
            }
            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

#Preview {
    FooterView()
}
