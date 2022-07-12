//
//  PokemonDetailView.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var pokemonModal: Pokemon
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var info = "Stats"
    @State private var saved = false
    let infoChoices = ["Stats", "Abilities"] // Will be used for the segemented Picker 
    let pokemon: User?
    var body: some View {
        VStack {
            ZStack {
                // Creating the frame for the image
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 230)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                // Displaying image
                PokemonRemoteImage(urlString: (pokemon?.sprites?.front_default)!)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 320, height: 225)
                    .cornerRadius(8.0)
            }
            .padding()
            Spacer()
            VStack {
                Picker("Stats", selection: $info) {
                    ForEach(infoChoices, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                if info == "Abilities" {
                    VStack {
                        HStack {
                            InfoTextView(pokemon: pokemon, index: 0).padding(.leading, 20)
                            Spacer(minLength: 40)
                            InfoTextView(pokemon: pokemon, index: 1).padding(.trailing, 20)
                        }
                        .padding(20)
                        HStack {
                            MoveTextView(pokemon: pokemon, index: 0).padding(.leading, 20)
                            Spacer(minLength: 40)
                            MoveTextView(pokemon: pokemon, index: 1).padding(.trailing, 20)
                        }.padding(20)
                    }
                } else if info == "Stats" {
                    VStack(alignment: .leading, spacing: 20.0) {
                        StatsTextView(pokemon: pokemon, index: 0, imageName: "heart.fill", title: "HP")
                        StatsTextView(pokemon: pokemon, index: 1, imageName: "line.diagonal.arrow", title: "Attack")
                        StatsTextView(pokemon: pokemon, index: 2, imageName: "shield.fill", title: "Defence")
                        StatsTextView(pokemon: pokemon, index: 5, imageName: "speedometer", title: "Speed")
                    }
                    .padding([.leading], 40)
                    .padding(.top, 5)
                }
                Spacer()
            }
            Spacer()
        }
        .navigationBarItems(trailing:
                                Button(action: {
                                    pokemonModal.add(pokemon!)
                                    saved.toggle()
                                    // Here we will check the pokemon has not been saved before
                                    // if that is the case then we create a new Pokemon and save to Persist
                                    // Making sure to the trigger User Defaults to true 
                                    if !UserDefaults.standard.bool(forKey: (pokemon?.name)!) {
                                    let newPokemon = PokemonEntity(context: managedObjectContext)
                                    newPokemon.name = pokemon?.name
                                    newPokemon.imageURL = pokemon?.sprites?.front_default!
                                    newPokemon.hp = Int64(pokemon!.stats![0].base_stat)
                                    PersistenceController.shared.save()
                                    UserDefaults.standard.setValue(true, forKey: (pokemon?.name)!)
                                    }
                                }, label: {
                                    Image(systemName:
                                        UserDefaults.standard.bool(forKey: (pokemon?.name)!) ? "heart.fill" : "heart")
                                        .renderingMode(.original)
                                }))
        .navigationTitle((pokemon?.name)!)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: User())
    }
}
