//
//  SearchResultsViewController.swift
//  Spotify
//
//  Created by rauan on 3/31/24.
//

import UIKit

fileprivate typealias userDataSource = UICollectionViewDiffableDataSource<SearchResultSection, SearchResultsDataModel>
fileprivate typealias dataSourceSnapshot = NSDiffableDataSourceSnapshot<SearchResultSection,SearchResultsDataModel>

class SearchResultsViewController: UIViewController {
    
    private var results = [SearchResultsDataModel]()
    private var searchResultDataSource: userDataSource!
    private var dataSource: userDataSource!
    
    private lazy var compositionalLayout: UICollectionView = {
        
        let compositionalView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        compositionalView.backgroundColor = .clear
        compositionalView.showsVerticalScrollIndicator = false
        compositionalView.register(SearchResultsCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultsCollectionViewCell.identifier)
        
        compositionalView.delegate = self
        
        return compositionalView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDataSource()
    }

    
    private func setupViews() {
        view.backgroundColor = .mainBackground
        view.addSubview(compositionalLayout)
        
        compositionalLayout.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
    }
    
    func update(with tracks: [SearchedTrackItem]) {
        results = []
        tracks.forEach { item in
            results.append(.init(
                id: item.id,
                image: item.album.images.first?.url,
                title: item.name,
                arist: item.artists.first?.name)
            )
        }
        
        applySnapshot()
    }
    
}

extension SearchResultsViewController {

    private func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 8, trailing: 16)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.20))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureDataSource() {
        
        dataSource = userDataSource(collectionView: compositionalLayout, cellProvider: { (collectionView, indexPath, contact) -> SearchResultsCollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultsCollectionViewCell.identifier, for: indexPath) as! SearchResultsCollectionViewCell
            cell.configure(data: contact)
            return cell
        })
//        var snapshot = dataSourceSnapshot()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(results)
//        dataSource.apply(snapshot, animatingDifferences: true)
    }
    func applySnapshot() {

        var snapshot = dataSourceSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(results)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension SearchResultsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        let trackPlayerViewController = TrackPlayerViewController()
        trackPlayerViewController.trackData = .init(id: item.id, coverImage: item.image, coverTitle: item.title, coverSubtitle: item.arist)
        print("id: \(item.id)")
        trackPlayerViewController.modalPresentationStyle = .overFullScreen
        present(trackPlayerViewController, animated: true)
    }
}


