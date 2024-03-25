//
//  PlaylistDetailsViewController.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import UIKit

class PlaylistDetailsViewController: UIViewController {
    
    private lazy var compostionalLayout: UICollectionView = {
        let compositionalLayout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            self.createCompositionalLayout(section: sectionIndex)
        }
        
        let compositionalView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        compositionalView.delegate = self
        compositionalView.dataSource = self
        compositionalView.backgroundColor = .clear
        compositionalView.showsVerticalScrollIndicator = false
        compositionalView.register(PlaylistGeneralDetailsCollectionViewCell.self, forCellWithReuseIdentifier: PlaylistGeneralDetailsCollectionViewCell.identifier)
        compositionalView.register(PlaylistDetailsCollectionViewCell.self, forCellWithReuseIdentifier: PlaylistDetailsCollectionViewCell.identifier)
        
        compositionalView.isSkeletonable = true
        return compositionalView
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupGradient()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        resetNavigationBar()
    }
    
    //MARK: - Gradient
    private func setupGradient() {
        let firstColor = UIColor(
            red: 0.0/255,
            green: 128.0/255.0,
            blue: 174.0/255.0,
            alpha: 1.0).cgColor
        let secondColor = UIColor.mainBackground.cgColor
        
        let gradient = CAGradientLayer()
        gradient.colors = [firstColor, secondColor]
        gradient.locations = [0.0, 0.55]
        gradient.type = .axial
        gradient.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    //MARK: - SetupNavigation
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
    
        navigationBarAppearance.backgroundColor = .clear
        navigationBarAppearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(didTapBackButton))
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    private func resetNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBarAppearance.backgroundColor = .mainBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    @objc
    private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
extension PlaylistDetailsViewController {
    private func setupViews() {
        view.backgroundColor = .mainBackground
        
        view.addSubview(compostionalLayout)
        
        compostionalLayout.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
    }
}

//MARK: - Setting up Copositional Layout

extension PlaylistDetailsViewController {
    private func createCompositionalLayout(section: Int) ->  NSCollectionLayoutSection{
        switch section {
        case 0:
            /// item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 2, leading: 0, bottom: 2, trailing: 2)
            /// group
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(0.65)),
                subitems: [item])
            /// section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 16, leading: 16, bottom: 4, trailing: 16)
            section.orthogonalScrollingBehavior = .none
            
            
            return section
        case 1:
            /// item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 2, leading: 0, bottom: 2, trailing: 2)
            /// group
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(80)),
                subitems: [item])
            /// section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 16, leading: 16, bottom: 4, trailing: 16)
            
            return section
            
        default:
            /// item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 2, leading: 0, bottom: 2, trailing: 2)
            /// group
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(0.6)),
                subitems: [item])
            /// section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 8, leading: 16, bottom: 4, trailing: 16)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = [
                .init(layoutSize:
                        .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .absolute(1.0)),
                      elementKind: UICollectionView.elementKindSectionHeader,
                      alignment: .top)]
            
            return section
        }
       
    }
}
//MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension PlaylistDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistGeneralDetailsCollectionViewCell.identifier, for: indexPath) as! PlaylistGeneralDetailsCollectionViewCell
            return cell
        case 1:
            let cell = compostionalLayout.dequeueReusableCell(withReuseIdentifier: PlaylistDetailsCollectionViewCell.identifier, for: indexPath) as! PlaylistDetailsCollectionViewCell
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
    }
    
    
    
}
