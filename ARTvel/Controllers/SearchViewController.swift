//
//  SearchViewController.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/25/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import FirebaseAuth
import Kingfisher

class SearchViewController: UIViewController {
    
    private enum Section {
        case main
    }
    
    private enum appState {
        case rijks
        case ticketmaster
    }
    
    let authSession = AuthSession()
    let searchView = SearchView()
    private var searchController: UISearchController!
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, ArtObject>
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
        
        // forced default art objects
        fetchSampleArtItems()
    }
    
    private func configureCollectionView()  {
        searchView.collectionView.register(RijksCell.self, forCellWithReuseIdentifier: RijksCell.reuseIdentifier)
    }
    
    private func configureSearchController()    {
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    // hardcoded search entry for rijk
    private func fetchSampleArtItems()  {
        RijksAPIClient.fetchArtObjects(searchQuery: "Rembrandt van Rijn") { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let artObjects):
                DispatchQueue.main.async {
                    self?.updateSnapshot(artItems: artObjects)
                }
            }
        }
    }
    
    // rijk only
    private func updateSnapshot(artItems: [ArtObject])   {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(artItems, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func configureDataSource()  {
        dataSource = UICollectionViewDiffableDataSource<Section, ArtObject>(collectionView: searchView.collectionView, cellProvider: { (collectionView, indexPath, artItem) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RijksCell.reuseIdentifier, for: indexPath) as? RijksCell else {
                fatalError()
            }
            
            cell.backgroundColor = .systemRed
            cell.titleLabel.text = artItem.title
            let url = URL(string: artItem.webImage.url)
            cell.imageView.kf.setImage(with: url)
            return cell
        })
        
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.main])
        //snapshot.appendItems(Array(1...100))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    // custom del
    // instance passing
    // dependency injection
    // state of the app
    
    
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
    
}

extension SearchViewController: UISearchBarDelegate {
   
}
