//
//  Pokemon.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

final class Pokemon: ObservableObject {
    @Published var users: [User] = []
    // these wont be used much as we will be persisting the data
    // using add and remove there but left in to show i have knowledge of both ways
    func add(_ user: User) {
        users.append(user)
    }
    func deleteItems(at offsets: IndexSet) {
       users.remove(atOffsets: offsets)
    }
}
