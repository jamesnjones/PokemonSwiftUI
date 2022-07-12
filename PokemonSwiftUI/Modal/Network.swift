//
//  Network.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct User: Codable, Hashable {
    var sprites: Sprites?
    var name: String?
    var abilities: [Abilities]?
    var stats: [Stats]?
    var moves: [Moves]?
}

struct Sprites: Codable, Hashable {
    // swiftlint:disable:next identifier_name
    var front_default: String?
}

struct Result: Codable, Hashable {
    var name: String
}

struct Abilities: Codable, Hashable {
    var ability: Ability
}

struct Ability: Codable, Hashable {
    var name: String
}

struct Stats: Codable, Hashable {
    // swiftlint:disable:next identifier_name
    var base_stat: Int
}

struct Moves: Codable, Hashable {
    var move: Move
}

struct Move: Codable, Hashable {
    var name: String
}
