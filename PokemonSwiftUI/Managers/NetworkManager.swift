//
//  NetworkManager.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import UIKit

final class NetworkManager {
    static let network = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    func downloadImage(fromURLString urlString: String, completed : @escaping(UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, _, _) in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
