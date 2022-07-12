//
//  ContentViewModal.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

final class ContentViewModal: ObservableObject {
    @Published var user = [User]()
    // Inital data load
    func loadData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { [self] data, _, _ in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // Needed to loop over the results in order to generate the image for each pokemon
                    for image in decodedResponse.results {
                        getImage(name: image.name)
                    }
                    return
                }
            }
        }.resume()
    }
    // Function to use inside above function to retrieve image
    func getImage(name: String) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name)/") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, _, _ in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(User.self, from: data) {
                    DispatchQueue.main.async {
                        self.user.append(decodedResponse)
                    }
                } else {
                    print("here")
                }
            }
        }.resume()
    }
}
