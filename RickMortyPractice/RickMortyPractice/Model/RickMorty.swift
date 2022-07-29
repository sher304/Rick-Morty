//
//  Model.swift
//  MVPProject
//
//  Created by Шермат Эшеров on 29/7/22.
//

import Foundation

struct RickAndMorty: Codable{
    let results: [Results]
}

struct Results: Codable{
    let name, status, species, type, gender, image: String
    let origin: Origin
    let location: Location
    let episode: [String]
}


struct Origin: Codable {
    let name: String
}

struct Location: Codable{
    let name: String
}


