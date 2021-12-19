//
//  HeroModel.swift
//  Avengers
//
//  Created by Kha Tran on 19/12/21.
//

import Foundation

struct HeroInfo: Decodable {
    let heros: [Hero]
}

struct Hero: Decodable {
    let response: String
    let id: String
    let name: String
    let powerstats: powerStats?
    
}

struct powerStats: Decodable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}
