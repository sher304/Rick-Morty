//
//  File.swift
//  RickMortyPractice
//
//  Created by Шермат Эшеров on 27/7/22.
//

import Foundation

protocol NetworkDelegate {
    
    func parse(comp: @escaping (RickAndMorty) -> ())
    func parseById(id: String,comp: @escaping (Results) -> ())
    
}


protocol ViewModelDelegate{
    
    func shareData()
}
