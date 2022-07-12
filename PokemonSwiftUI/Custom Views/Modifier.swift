//
//  Modifier.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 12/07/2022.
//

import SwiftUI

struct Modifier: ViewModifier {
    // Save duplicate code by creating custom Modifer 
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .frame(width: 120, height: 44)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
    }
}
