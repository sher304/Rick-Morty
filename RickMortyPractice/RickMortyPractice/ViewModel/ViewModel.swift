//
//  ViewModel.swift
//  RickMortyPractice
//
//  Created by Шермат Эшеров on 27/7/22.
//

import Foundation


class ViewModel: ViewModelDelegate {
    
    private lazy var network: Network = {
        return Network()
    }()
    
    let items = Dynamic(RickAndMorty(results: []))
    
    func shareData(){
        network.parse{ [self] data in
            items.value = data
        }
    }
    
    init() {
        
    }

}
