//
//  StatsTextView.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 12/07/2022.
//

import SwiftUI

struct StatsTextView: View {
    let pokemon: User?
    var index: Int
    var imageName: String
    var title: String
    var length: Int {
        return 120 - pokemon!.stats![index].base_stat
    }
    var body: some View {
        HStack(spacing: 25.0) {
            Image(systemName: imageName)
            Text("\(title): \(pokemon!.stats![index].base_stat)")
                .font(.title3)
            Spacer()
        }
        Rectangle()
            .frame(width: CGFloat(pokemon!.stats![index].base_stat) * 4, height: 2)
            .padding(8)
            .foregroundColor(pokemon!.stats![index].base_stat > 60 ? .green : .red)
    }
}
