//
//  FavsView.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

struct FavsView: View {
    // reference to the environmentObject 
    @EnvironmentObject var pokemonModal: Pokemon
    @Environment(\.managedObjectContext) var managedObjectContext

    // Reference to data saved within Pokemon entity 
    @FetchRequest(entity: PokemonEntity.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \PokemonEntity.name,
                  ascending: true)]) var fetchedPokemon: FetchedResults<PokemonEntity>
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedPokemon, id: \.self) { poke in
                        HStack {
                            PokemonRemoteImage(urlString: poke.imageURL!)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 100)
                                .cornerRadius(8.0)
                            VStack(alignment: .leading) {
                                Text(poke.name!)
                                    .font(.title2)
                                    .bold()
                                Text("HP: \(poke.hp)")
                                    .font(.caption)
                            }
                        }
                    .padding()
                }
                .onDelete(perform: removePokemon)
            }
            .toolbar {
                EditButton()
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("PokeDex")
        }
    }
        // Will remover pokemon and delete from Core data
    func removePokemon(at offsets: IndexSet) {
        for index in offsets {
            let pokemon = fetchedPokemon[index]
            managedObjectContext.delete(pokemon)
            // Must return this to false so we can re-add this pokemon in future
            UserDefaults.standard.setValue(false, forKey: pokemon.name!)
        }
            PersistenceController.shared.save()
    }
}

struct FavsView_Previews: PreviewProvider {
    static var previews: some View {
        FavsView()
    }
}
