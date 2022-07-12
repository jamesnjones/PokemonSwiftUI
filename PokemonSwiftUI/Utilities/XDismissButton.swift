//
//  XDismissButton.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 330/06/2022.
//

import SwiftUI

struct XDismissButton: View {
    // Simple view to display the dismiss button in the corner 
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(.black))
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .imageScale(.small)
                .frame(width: 44, height: 44)
        }
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
