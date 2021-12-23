//
//  HeroFetcher.swift
//  Avengers
//
//  Created by Kha Tran on 23/12/21.
//

import Foundation
import UIKit

class HeroFetcher {
    
    let shared = HeroFetcher()
    let tableView = UITableView()
    var hero = [Hero]()
    
    func fetchHero() {
        
        let baseUrl = URL(string: "https://www.superheroapi.com/api.php/4632428266824459/300")!
        
        URLSession.shared.request(
            url: baseUrl,
            expecting: Hero.self,
            completion: { result in
            switch result {
            case .success(let heros):
                DispatchQueue.main.async {
                    self.hero = [heros]
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}
