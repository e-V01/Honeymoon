//
//  AppInfoView.swift
//  Honeymoon
//
//  Created by Y K on 12.04.2024.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone&iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Yuriy K")
            RowAppInfoView(itemOne: "Designer", itemTwo: "Robert P")
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Website", itemTwo: "youtube.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
        }
    }
}

#Preview {
    AppInfoView()
}

struct RowAppInfoView: View {
    var itemOne: String
    var itemTwo: String

    var body: some View {
        HStack {
            Text(itemOne)
                .foregroundStyle(Color.gray)
            Spacer()
            Text(itemTwo)
        }
        Divider()
    }
}
