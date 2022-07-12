//
//  InfoTextView.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 12/07/2022.
//

import SwiftUI

struct InfoTextView: View {
    let pokemon: User?
    var index: Int
    var body: some View {
        Text((pokemon?.abilities![index].ability.name)!)
            .modifier(Modifier())
    }
}
