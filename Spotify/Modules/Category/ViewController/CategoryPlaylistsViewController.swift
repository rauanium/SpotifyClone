//
//  CategoryPlaylistsViewController.swift
//  Spotify
//
//  Created by rauan on 4/5/24.
//

import UIKit

fileprivate typealias CategoryPlaylistsDataSource = UICollectionViewDiffableDataSource<CategoryPlaylistsSection, CategoryPlaylistsModel>
fileprivate typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<CategoryPlaylistsSection, CategoryPlaylistsModel>

class CategoryPlaylistsViewController: UIViewController {
    private var categoryPlaylistsList = [CategoryPlaylistsModel]()
    private var dataSource: CategoryPlaylistsDataSource!
    var categoryPlaylistID: String?
    var categoryTitle: String?
    var viewModel: CategoryPlaylistsViewModel?
    
    //MARK: - Compositional Layout
    private lazy var compositionalLayout: UICollectionView = {
        let compositionalView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        compositionalView.backgroundColor = .clear
        compositionalView.delegate = self
        compositionalView.showsVerticalScrollIndicator = false
        compositionalView.register(CategoryPlaylistsCollectionViewCell.self, forCellWithReuseIdentifier: CategoryPlaylistsCollectionViewCell.identifier)
        
        return compositionalView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDataSource()
        setupViewModel()
    }
    
    //MARK: - Setting ViewModel
    private func setupViewModel() {
        viewModel = CategoryPlaylistsViewModel()
        guard let id = categoryPlaylistID else { return }
        print("CategoryId: \(id)")
        viewModel?.getCategoryPlaylists(id: id, completion: { [weak self] result in
            result.forEach { item in
                self?.categoryPlaylistsList.append(.init(
                    id: item.id,
                    image: item.images.first?.url ?? "",
                    title: item.name)
                    
                    )
            }
            self?.applySnapshot()
        })
    }
    //MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .mainBackground
        view.addSubview(compositionalLayout)

        compositionalLayout.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(8)
        }
        guard let title = categoryTitle else { return }
        navigationItem.title = title
    }
}

//MARK: - Setting DiffableDataSource and Delegate
extension CategoryPlaylistsViewController {
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(220)
            ),
            repeatingSubitem: item,
            count: 2
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 16, leading: 0, bottom: 0, trailing: 0)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureDataSource() {
        dataSource = CategoryPlaylistsDataSource(collectionView: compositionalLayout, cellProvider: { (collectionView, indexPath, contact) -> CategoryPlaylistsCollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryPlaylistsCollectionViewCell.identifier,
                for: indexPath) as! CategoryPlaylistsCollectionViewCell
            cell.configure(data: contact)
            return cell
        })

    }
    
    private func applySnapshot() {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.categoryPlaylistsList)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    

    
}

extension CategoryPlaylistsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        let playlistDetailsViewController = PlaylistDetailsViewController()
        playlistDetailsViewController.playlistID = item.id
        print("id: \(item.id)")
        playlistDetailsViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(playlistDetailsViewController, animated: true)
    }
}
