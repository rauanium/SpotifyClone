//
//  ViewController.swift
//  Spotify
//
//  Created by rauan on 2/14/24.
//

import UIKit
import SnapKit
import SkeletonView

class HomeViewController: BaseViewController {
    var viewModel: HomeViewModel?
    let dispatchGroup = DispatchGroup()
    
    private lazy var compositionLayout: UICollectionView = {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            self.createCompostionalLayout(section: sectionIndex)
        }
        
        let compositionLayout = UICollectionView(frame: .zero, collectionViewLayout: layout)
        compositionLayout.delegate = self
        compositionLayout.dataSource = self
        compositionLayout.showsVerticalScrollIndicator = false
        compositionLayout.showsHorizontalScrollIndicator = false
        compositionLayout.backgroundColor = .clear
        compositionLayout.register(AlbumsAndPlaylistsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        compositionLayout.register(RecommendedCollectionViewCell.self, forCellWithReuseIdentifier: "recommendedCell")
        compositionLayout.register(SectionHeaderView.self,
                                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                   withReuseIdentifier: "sectionHeader")
        compositionLayout.isSkeletonable = true
        return compositionLayout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupViewModel()
        setupNavigationBar()
    }
    
    override func setupLanguage() {
        navigationItem.title = "Home".localized
    }
    
    private func setupViewModel() {
        viewModel = HomeViewModel()
        compositionLayout.showAnimatedGradientSkeleton(
            usingGradient: .init(baseColor: .silver),
            transition: .crossDissolve(0.3))
        
        
        dispatchGroup.enter()
        viewModel?.didLoad()
        dispatchGroup.leave()
        
        dispatchGroup.enter()
        viewModel?.loadRecomended(completion: {
            self.dispatchGroup.leave()
        })

        dispatchGroup.enter()
        viewModel?.loadFeaturedPlaylists(completion: {
            self.dispatchGroup.leave()
        })

        dispatchGroup.enter()
        viewModel?.loadNewReleasedAlbums(completion: {
            self.dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: .main) {
            self.compositionLayout.hideSkeleton()
            self.compositionLayout.reloadData()
        }
    }

    private func setupNavigationBar() {
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        navigationBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBarAppearance.backgroundColor = .mainBackground
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        let textColor = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textColor
        navigationController?.navigationBar.largeTitleTextAttributes = textColor
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(didTapSettings))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.setBackBarItem()
    }
    
    private func setupViews() {
        view.backgroundColor = .mainBackground
        navigationItem.title = "Home".localized
        
        view.addSubview(compositionLayout)
        
        compositionLayout.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
    }
    
    @objc
    func didTapSettings() {
        let settings = SettingsViewController()
        settings.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(settings, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel?.numberOfSections ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = viewModel?.getSectionViewModel(at: section)
        switch type {
        case .newRelseasedAlbums(_, let dataModel):
            return dataModel.count
        case .featuredPlaylists(_, let dataModel):
            return dataModel.count
        case .recommended(_, let dataModel):
            return dataModel.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = viewModel?.getSectionViewModel(at: indexPath.section)
        switch type {
        case .newRelseasedAlbums(_, let dataModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbumsAndPlaylistsCollectionViewCell
            cell.configure(data: dataModel[indexPath.row])
            return cell
            
        case .featuredPlaylists(_, let dataModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbumsAndPlaylistsCollectionViewCell
            cell.configure(data: dataModel[indexPath.row])
            return cell
        case .recommended(_, let dataModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as! RecommendedCollectionViewCell
            cell.configure(with: dataModel[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "sectionHeader",
            for: indexPath) as! SectionHeaderView
        let type = viewModel?.getSectionViewModel(at: indexPath.section)
        switch type {
        case .featuredPlaylists(let title, _):
            header.configure(headerLabel: title)
        case .newRelseasedAlbums(let title, _):
            header.configure(headerLabel: title)
        case .recommended(let title, _):
            header.configure(headerLabel: title)
        default:
            break
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = viewModel?.getSectionViewModel(at: indexPath.section)
        switch type {
        case .newRelseasedAlbums(_, let dataModel):
            let albumDetailsViewController = AlbumDetailsViewController()
            albumDetailsViewController.albumID = dataModel[indexPath.row].albumID
            albumDetailsViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(albumDetailsViewController, animated: true)
            
        case .featuredPlaylists(_, let dataModel):
            let playlistDetailsViewController = PlaylistDetailsViewController()
            playlistDetailsViewController.playlistID = dataModel[indexPath.row].albumID
            playlistDetailsViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(playlistDetailsViewController, animated: true)

        case .recommended(_, let dataModel):
            let trackPlayerViewController = TrackPlayerViewController()
            trackPlayerViewController.trackData = dataModel[indexPath.row]
            trackPlayerViewController.modalPresentationStyle = .overFullScreen
            present(trackPlayerViewController, animated: true)
            
        default:
            break
        }
    } 
}
//MARK: - Compositional Layout Setting
extension HomeViewController {
    private func createCompostionalLayout(section: Int) -> NSCollectionLayoutSection {
        switch section {
            
        case 0:
//            Item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = .init(top: 2, leading: 0, bottom: 2, trailing: 2)
            
            //        Group
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(168),
                    heightDimension: .absolute(220)),
                repeatingSubitem: item,
                count: 1)
            //        Section
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.contentInsets = .init(top: 8, leading: 16, bottom: 4, trailing: 16)
            section.orthogonalScrollingBehavior = .continuous
            
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                        heightDimension: .estimated(60)),
                      elementKind: UICollectionView.elementKindSectionHeader,
                      alignment: .top)
                
            ]
            return section
            
        case 1:
//            Item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = .init(top: 2, leading: 0, bottom: 2, trailing: 2)
            
            //        Group
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(168),
                    heightDimension: .absolute(220)),
                repeatingSubitem: item,
                count: 1)
            //        Section
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.contentInsets = .init(top: 4, leading: 16, bottom: 4, trailing: 16)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                        heightDimension: .estimated(60)),
                      elementKind: UICollectionView.elementKindSectionHeader,
                      alignment: .top),
                
            ]
            return section
            
        case 2:
//            Item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = .init(top: 2, leading: 0, bottom: 2, trailing: 2)
            
            //        Group
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(70)),
                repeatingSubitem: item,
                count: 1)
            //        Section
            let section = NSCollectionLayoutSection(group: verticalGroup)
            section.contentInsets = .init(top: 4, leading: 16, bottom: 16, trailing: 16)
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                        heightDimension: .estimated(60)),
                      elementKind: UICollectionView.elementKindSectionHeader,
                      alignment: .top),
                
            ]
            return section
            
        default:
//            Item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            
            //        Group
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(70)),
                repeatingSubitem: item,
                count: 1)
            //        Section
            let section = NSCollectionLayoutSection(group: verticalGroup)
            section.contentInsets = .init(top: 4, leading: 16, bottom: 4, trailing: 16)
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                        heightDimension: .estimated(60)),
                      elementKind: UICollectionView.elementKindSectionHeader,
                      alignment: .top),
                
            ]
            return section
            
        }
        
    }
}

//MARK: - Skeleton CollectionView DataSource

extension HomeViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        let type = viewModel?.getSectionViewModel(at: indexPath.section)
        switch type {
        case .newRelseasedAlbums:
            return "cell"
        case .featuredPlaylists:
            return "cell"
        case .recommended:
            return "recommendedCell"
        default:
            return ""
        }
    }
    
    func numSections(in collectionSkeletonView: UICollectionView) -> Int {
        return viewModel?.numberOfSections ?? 1
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = viewModel?.getSectionViewModel(at: section)
        
        switch type {
        case .newRelseasedAlbums:
            return 3
        case .featuredPlaylists:
            return 3
        case .recommended:
            return 4
        default:
            return 1
        }
    }
}
