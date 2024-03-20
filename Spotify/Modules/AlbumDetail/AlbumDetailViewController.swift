//
//  AlbumDetailViewController.swift
//  Spotify
//
//  Created by rauan on 3/20/24.
//

import UIKit
import SnapKit

class AlbumDetailViewController: BaseViewController {
    var albumID: String?
    
    private lazy var albumCover = ImageFactory.createImage(
        width: 150,
        height: 150,
        imageNamed: UIImage(named: "cover3"),
        isSkeletonable: true
    )
    
    private let albumInfoStack = StackFactory.createStack(
        distribution: .fillEqually,
        isSkeletonable: true
    )
    
    private lazy var albumName = LabelFactory.createLabel(
        text: "All the Stars",
        font: UIFont.systemFont(ofSize: 28, weight: .bold),
        numberOfLines: 1,
        height: 30,
        isSkeletonable: true
    )
    
    private lazy var albumDescription = LabelFactory.createLabel(
        text: "The essential tracks, all in one playlist.",
        font: UIFont.systemFont(ofSize: 13),
        textColor: .subtitle,
        numberOfLines: 1,
        isSkeletonable: true
    )
    
    private lazy var artistStack = StackFactory.createStack(
        axis: .horizontal,
        spacing: 8,
        alignment: .center,
        distribution: .fillProportionally,
        isSkeletonable: true
    )
    
    private lazy var artistCover = ImageFactory.createImage(
        contentMode: .scaleAspectFill,
        imageNamed: UIImage(named: "AppIcon"),
        isSkeletonable: true
    )
    
    private lazy var artistName = LabelFactory.createLabel(
        text: "Kendrik Lamar",
        font: UIFont.systemFont(ofSize: 13),
        numberOfLines: 1,
        isSkeletonable: true
    )
    
    private lazy var albumDuration = LabelFactory.createLabel(
        text: "2 hr 9 min",
        font: UIFont.systemFont(ofSize: 13),
        textColor: .subtitle,
        numberOfLines: 1,
        height: 20,
        isSkeletonable: true
    )
    
    private lazy var albumActionStack = StackFactory.createStack(
        axis: .horizontal,
        alignment: .center,
        distribution: .fillProportionally,
        isSkeletonable: true
    )
    
    private lazy var albumIconStack = StackFactory.createStack(
        axis: .horizontal,
        alignment: .center,
        distribution: .fillProportionally,
        isSkeletonable: true
    )
    
    private lazy var favoriteImage = ImageFactory.createImage(
        cornerRadius: 0,
        imageNamed: UIImage(systemName: "heart"),
        isSkeletonable: true
    )
    
    private lazy var shareImage = ImageFactory.createImage(
        cornerRadius: 0,
        imageNamed: UIImage(systemName: "square.and.arrow.up"),
        isSkeletonable: true
    )

    private lazy var moreImage = ImageFactory.createImage(
        contentMode: .scaleAspectFit,
        cornerRadius: 0,
        imageNamed: UIImage(named: "optionsIcon"),
        isSkeletonable: true
    )
    
    private lazy var playPauseImage = ImageFactory.createImage(
        cornerRadius: 0,
        imageNamed: UIImage(named: "playImage"),
        isSkeletonable: true
    )
    
    
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

//MARK: - Setup Views
extension AlbumDetailViewController {
    private func setupViews() {
        view.backgroundColor = .mainBackground
        [albumCover, albumInfoStack, albumActionStack].forEach {
            view.addSubview($0)
        }
        
        [albumName, albumDescription, artistStack, albumDuration].forEach {
            albumInfoStack.addArrangedSubview($0)
        }
        
        [artistCover, artistName].forEach {
            artistStack.addArrangedSubview($0)
        }
        
        [albumIconStack, playPauseImage].forEach {
            albumActionStack.addArrangedSubview($0)
        }
        
        [favoriteImage, shareImage, moreImage].forEach {
            albumIconStack.addArrangedSubview($0)
        }
        
        albumCover.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.centerX.equalToSuperview()
        }
        
        albumInfoStack.snp.makeConstraints { make in
            make.top.equalTo(albumCover.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(120)
        }
        
        artistStack.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
        
        artistCover.snp.makeConstraints { make in
            make.width.equalTo(24)
        }
        
        albumActionStack.snp.makeConstraints { make in
            make.top.equalTo(albumInfoStack.snp.bottom)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
        
        albumIconStack.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalTo(100)
            
        }
        playPauseImage.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        favoriteImage.snp.makeConstraints { make in
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        shareImage.snp.makeConstraints { make in
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        moreImage.snp.makeConstraints { make in
            make.width.equalTo(22)
            make.height.equalTo(24)
        }
        
    }
}
