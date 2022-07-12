//
//  ContentView.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModal: ContentViewModal
    @State private var user = [User]()
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var shown = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("search", text: $searchText, onEditingChanged: { _ in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)
                        .autocapitalization(.none)
                        Button(action: {
                            self.searchText = ""
                        }, label: { Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        })
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    if showCancelButton {
                        Button("Cancel") {
                            self.searchText = ""
                            self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                // List to display the first 20 Pokemon that appear
                List {
                ForEach( viewModal.user.filter {$0.name!.contains(searchText) || searchText == ""}, id: \.self) {poke in
                       // Allow us to pass the poke details to another screen and display the data
                        NavigationLink(destination: PokemonDetailView(pokemon: poke)) {
                            HStack {
                                PokemonRemoteImage(urlString: (poke.sprites?.front_default)!)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 100)
                                    .cornerRadius(8.0)
                                Text(poke.name!)
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding()
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Pokemon")
                // There seems to an issue with Swiftui calling onAppear repeatedly so this is a workaround that issue
                // when on appear is called the inital data will load
                .onAppear(perform: shown ? nil : viewModal.loadData)
                .onAppear {
                    shown = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(viewModal: ContentViewModal())
        }
    }
}
