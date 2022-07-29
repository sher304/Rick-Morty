//
//  Network.swift
//  RickMortyPractice
//
//  Created by Шермат Эшеров on 27/7/22.
//

import Foundation


class Network: NetworkDelegate {
    
    
    func parse(comp: @escaping (RickAndMorty) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/") else { return }
        let session = URLSession.shared

        session.dataTask(with: url) { data, _, _ in
                guard let data = data else {
                    return
                }
                guard let json = try? JSONDecoder().decode(RickAndMorty.self, from: data) else { return }
                comp(json)
        }.resume()
    }
    
    
    func parseById(id: String,comp: @escaping (Results) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else { return }
        let session = URLSession.shared

        session.dataTask(with: url) { data, _, _ in
                guard let data = data else {
                    return
                }
                guard let json = try? JSONDecoder().decode(Results.self, from: data) else { return }
                comp(json)
            }.resume()
        }
}
