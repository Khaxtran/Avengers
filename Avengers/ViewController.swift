//
//  ViewController.swift
//  Avengers
//
//  Created by Kha Tran on 17/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var hero = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.safeAreaLayoutGuide
        setupTableView()
        
        
        fetchHero()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let hero = hero[indexPath.row]
        cell.textLabel?.text = hero.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hero.count
    }
}
