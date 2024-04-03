//
//  SearchViewController.swift
//  Spotify
//
//  Created by rauan on 2/22/24.
//

import UIKit

class SearchViewController: BaseViewController {
//    var categoryData = SearchViewModel.shared.categoryData
    var viewModel: SearchViewModel?
    private lazy var compositionalLayout: UICollectionView = {
        let compositionalLayout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection?  in
            self.createCompostionalLayout(section: sectionIndex)
        }
        
        let compositionalView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        compositionalView.delegate = self
        compositionalView.dataSource = self
        compositionalView.backgroundColor = .clear
        compositionalView.showsVerticalScrollIndicator = false
        compositionalView.register(
            CategoriesCollectionViewCell.self,
            forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        compositionalView.register(SectionHeaderView.self,
                                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                   withReuseIdentifier: "searchHeader")
        
        return compositionalView
    }()

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
        setupViewModel()
//        print("categoryData: \(categoryData)")
    }
    
    func setupViewModel() {
        viewModel = SearchViewModel()
        viewModel?.didLoad()
        viewModel?.loadCategories(completion: {
            self.compositionalLayout.reloadData()
        })
        
        viewModel?.loadSearchedTracks(completion: {
            
        })
    }
    
    func setupViews() {
        view.addSubview(compositionalLayout)
        navigationItem.searchController = searchViewController
        view.backgroundColor = .mainBackground
        navigationItem.title = "Search"
        
        compositionalLayout.snp.makeConstraints { make in
            make.bottom.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(8)
        }
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

extension SearchViewController {
    private func createCompostionalLayout(section: Int) -> NSCollectionLayoutSection {
        switch section {
        case 0:
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(120)), repeatingSubitem: item, count: 2)
            
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 16, leading: 0, bottom: 0, trailing: 0)
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                        heightDimension: .estimated(60)),
                      elementKind: UICollectionView.elementKindSectionHeader,
                      alignment: .top)
            ]
            
            return section
            
        default:
            print("default")
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalHeight(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(92)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
    
    private func createCompositionalLayoutHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .estimated(50))
        // 2
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size,
                                                                 elementKind: "header",
                                                                 alignment: .top)
        return header
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = viewModel?.getSectionViewModel(at: section)
        switch type {
        case .categoryItem(let dataModel):
            print(dataModel.count)
            return dataModel.count
        default:
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = viewModel?.getSectionViewModel(at: indexPath.section)
        switch type {
        case .categoryItem(let dataModel):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoriesCollectionViewCell.identifier,
                for: indexPath) as! CategoriesCollectionViewCell
            cell.configure(data: dataModel[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "searchHeader",
            for: indexPath) as! SectionHeaderView
        header.configure(headerLabel: "Browse all")
        return header
    }
    
    
}
