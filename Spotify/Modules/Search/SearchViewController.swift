//
//  SearchViewController.swift
//  Spotify
//
//  Created by rauan on 2/22/24.
//

import UIKit

class SearchViewController: BaseViewController {

    private lazy var searchViewController: UISearchController = {
        let searchViewController = UISearchController(searchResultsController: SearchResultsViewController())
        searchViewController.searchBar.placeholder = "What do you want to listen to?"
        searchViewController.searchBar.searchBarStyle = .minimal
        searchViewController.definesPresentationContext = true
        searchViewController.searchBar.tintColor = .white
        searchViewController.searchBar.searchTextField.backgroundColor = .white
        searchViewController.searchResultsUpdater = self
        return searchViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        navigationItem.searchController = searchViewController
        view.backgroundColor = .mainBackground
        navigationItem.title = "Search"
    }
}

extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard 
            let searchResultsViewController = searchController.searchResultsController as? SearchResultsViewController,
            let searchedText = searchController.searchBar.text,
            !searchedText.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return
        }
        print("searchedText: \(searchedText)")
    }
}
