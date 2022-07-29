//
//  DetailViewModel.swift
//  RickMortyPractice
//
//  Created by Шермат Эшеров on 29/7/22.
//

import Foundation

class DetailViewModel{
    
    private lazy var networking: Network = {
        return Network()
    }()

    let items = Dynamic(Results(name: "", status: "", species: "", type: "", gender: "", image: "", origin: Origin(name: ""), location: Location(name: ""), episode: []))
    
    var indx: String?
    
    func setId(id: String){
        indx = id
    }
    
    func shareData(){
        networking.parseById(id: indx ?? "", comp: { [self] datas in
            items.value = datas
        })
    }
    
}
