//
//  MoveTextView.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

struct MoveTextView: View {
    let pokemon: User?
    var index: Int
    var body: some View {
        Text("\(pokemon!.moves![index].move.name)")
            .modifier(Modifier())
    }
}
