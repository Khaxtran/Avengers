//
//  ViewController.swift
//  Avengers
//
//  Created by Kha Tran on 17/12/21.
//

import UIKit


class SearchVC: UIViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: SearchResultsVC())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        navigationItem.title = "Search"
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
        
    }
    
}


