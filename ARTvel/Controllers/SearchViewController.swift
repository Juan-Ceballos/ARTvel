//
//  SearchViewController.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/25/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import FirebaseAuth
class SearchViewController: UIViewController {
    
    private enum Section {
        case main
    }
    
    let authSession = AuthSession()
    let searchView = SearchView()
    private var searchController: UISearchController!
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Int>
    private var dataSource: DataSource!
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureSearchController()
        configureCollectionView()
        configureDataSource()
    }
    
    private func configureCollectionView()  {
        searchView.collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.reuseIdentifier)
    }
    
    private func configureSearchController()    {
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func configureDataSource()  {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: searchView.collectionView, cellProvider: { (collectionView, indexPath, int) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.reuseIdentifier, for: indexPath) as? SearchCell else {
                fatalError()
            }
            
            cell.backgroundColor = .systemRed
            return cell
        })
        
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(1...100))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    // custom del
    // instance passing
    // dependency injection
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
    
}

extension SearchViewController: UISearchBarDelegate {
   
}
