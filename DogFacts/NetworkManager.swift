//
//  NetworkManager.swift
//  DogFacts
//
//  Created by Konstantin Fomenkov on 09.04.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private let imageURL = "https://place.dog/388/277"
    private let factURL = "https://dog-api.kinduff.com/api/facts?number=1"

    func fetchImage(completion: @escaping (Data) -> ()) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description found!")
                return
            }
            completion(data)
        }.resume()
    }

    func fetchFact(completion: @escaping (DogFact) -> ()) {
        guard let url = URL(string: factURL) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description found!")
                return
            }
            do {
                let fact = try JSONDecoder().decode(DogFact.self, from: data)
                completion(fact)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    private init() {}
}
