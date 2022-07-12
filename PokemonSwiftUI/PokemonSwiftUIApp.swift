//
//  PokemonSwiftUIApp.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

@main
struct PokemonSwiftUIApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        let pokemon = Pokemon()
        WindowGroup {
            AppTabView()
                .environmentObject(pokemon)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            // Putting the core data and the Pokemon class into the environment to be made available for entire scope
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
            // this will ensure if the user closes the app we will save 
        }
    }
}
