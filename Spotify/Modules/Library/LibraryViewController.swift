//
//  LibraryViewController.swift
//  Spotify
//
//  Created by rauan on 2/22/24.
//

//import UIKit
//
//class LibraryViewController: UIViewController {
//    
//    var dataSource: UICollectionViewDiffableDataSource<SearchResultSection, SearchResultsDataModel>! = nil
//    
//    private var results: [SearchResultsDataModel] = [
//        .init(title: "10"),
//        .init(title: "12"),
//        .init(title: "14"),
//        .init(title: "15"),
//        .init(title: "16"),
//        
//    ]
//    
//    
//    
//    
//    private lazy var compositionalLayout: UICollectionView = {
//        let compositionalLayout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
//            self.createCompositionalLayout(section: sectionIndex)
//        }
//        let compositionalView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
//        compositionalView.backgroundColor = .clear
//        compositionalView.showsVerticalScrollIndicator = false
//        compositionalView.register(SearchResultsCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultsCollectionViewCell.identifier)
//        
//        
//        
//        return compositionalView
//    }()
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        configureDataSource()
//        
//        
//        
//    }
//    private func configureDataSource() {
//        
//        let cellRegistration = UICollectionView.CellRegistration<SearchResultsCollectionViewCell, SearchResultsDataModel> { (cell, indexPath, item) in
//            cell.configure(data: item)
//            
//            
//        }
//        
////        dataSource = UICollectionViewDiffableDataSource<SearchResultSection, SearchResultsDataModel>
////        (collectionView: compositionalLayout) {
////            (collectionView: UICollectionView, indexPath: IndexPath, identifier: SearchResultsDataModel) -> SearchResultsCollectionViewCell? in
////            // Return the cell.
////            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
////        }
//
//        dataSource = UICollectionViewDiffableDataSource<SearchResultSection, SearchResultsDataModel>(collectionView: compositionalLayout) { collectionView,indexPath,itemIdentifier in
//            return self.compositionalLayout.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
//        }
//        
//        // initial data
//        var snapshot = NSDiffableDataSourceSnapshot<SearchResultSection, SearchResultsDataModel>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(results)
//        dataSource.apply(snapshot, animatingDifferences: false)
//    }
//    
//    
//    private func createLayout() -> UICollectionViewLayout {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                             heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                              heightDimension: .absolute(50))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
//                                                         subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        return layout
//    }
//    
//    
//    
//    
//    
//    
//    
//        
//    private func setupViews() {
//        view.backgroundColor = .mainBackground
//        view.addSubview(compositionalLayout)
//        
//        compositionalLayout.snp.makeConstraints { make in
//            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
//            make.left.right.equalToSuperview().inset(16)
//        }
//    }
//}
//
//extension LibraryViewController {
//    private func createCompositionalLayout(section: Int) -> NSCollectionLayoutSection {
//        switch section {
//        case 0:
//            let itemSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalHeight(1.0)
//            )
//            
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
//            
//            let group = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .absolute(50)),
//                subitems: [item])
//            
//            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
//            return section
//            
//        default:
//            let itemSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalHeight(1.0)
//            )
//            
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            
//            let group = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .absolute(50)),
//                subitems: [item])
//            
//            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
//            return section
//        }
//    }
//}


import UIKit

fileprivate typealias ContactDataSource  = UICollectionViewDiffableDataSource<SearchResultSection, SearchResultsDataModel>
fileprivate typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<SearchResultSection, SearchResultsDataModel>

class LibraryViewController: UIViewController {
    
    let cellId = "cellId"
    private var contacts = [SearchResultsDataModel]()
    private var dataSource: ContactDataSource!
    
    private lazy var compositionalLayout: UICollectionView = {
//        let compositionalLayout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
//            self.createCompositionalLayout(section: sectionIndex)
//        }
        let compositionalView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        compositionalView.backgroundColor = .clear
        compositionalView.showsVerticalScrollIndicator = false
        compositionalView.register(SearchResultsCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultsCollectionViewCell.identifier)
        
        
        
        return compositionalView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Diffable Data Source"
        
        createData()
        setupViews()
        configureDataSource()
    }
    private func setupViews() {
            view.backgroundColor = .mainBackground
            view.addSubview(compositionalLayout)
    
            compositionalLayout.snp.makeConstraints { make in
                make.top.bottom.equalTo(view.safeAreaLayoutGuide)
                make.left.right.equalToSuperview().inset(16)
            }
        }
    
}

//MARK: - Collection View Setup
extension LibraryViewController {
    
    private func createData() {
          for i in 0..<15 {
//              contacts.append(.init(title: "number: \(i)"))
          }
      }
    
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
        
        dataSource = ContactDataSource(collectionView: compositionalLayout, cellProvider: { (collectionView, indexPath, contact) -> SearchResultsCollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultsCollectionViewCell.identifier, for: indexPath) as! SearchResultsCollectionViewCell
            cell.configure(data: contact)
            return cell
        })
        
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.contacts)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

