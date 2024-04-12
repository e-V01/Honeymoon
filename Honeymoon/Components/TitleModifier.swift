//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Y K on 12.04.2024.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(Color.pink)
    }
}


