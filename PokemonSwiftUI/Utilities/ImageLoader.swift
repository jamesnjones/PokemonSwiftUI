//
//  ImageLoader.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image?
    // to display image from JSON Data 
    func load(fromURLString urlString: String) {
        NetworkManager.network.downloadImage(fromURLString: urlString) { (uiImage) in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image(systemName: "person")
    }
}

struct PokemonRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}
