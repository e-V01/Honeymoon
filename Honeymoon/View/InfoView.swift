//
//  InfoView.swift
//  Honeymoon
//
//  Created by Y K on 12.04.2024.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Spacer(minLength: 10)
                
                Button {
                    dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
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
    InfoView()
}
