//
//  HeroAPI.swift
//  Avengers
//
//  Created by Kha Tran on 19/12/21.
//

import Foundation

class HeroAPI {
    
    static let shared = HeroAPI()
    
    func fetchHero() {
        
        let baseUrl = URL(string: "https://www.superheroapi.com/api.php/4632428266824459/1")!
        
        URLSession.shared.request(
            url: baseUrl,
            expecting: HeroInfo.self,
            completion: { result in
            switch result {
            case .success(let heros):
                print(heros.heros)
            case .failure(let error):
                print(error)
            }
        })
    }
}

