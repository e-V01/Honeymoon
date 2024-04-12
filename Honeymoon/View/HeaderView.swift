//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Y K on 11.04.2024.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool

    var body: some View {
        HStack {
            Button {
                self.showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            Spacer()
            Button {
                self.showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
            
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false

    static var previews: some View {
        HeaderView(showGuideView: $showGuide,
                   showInfoView: $showInfo)
    }
}
