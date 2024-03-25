//
//  PlaylistGeneralDetailsCollectionViewCell.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import UIKit

class PlaylistGeneralDetailsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PlaylistGeneralDetailsCollectionViewCell"
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
        imageNamed: UIImage(named: "cover4"),
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
        distribution: .equalCentering,
        isSkeletonable: true
    )
    
    private lazy var albumIconStack = StackFactory.createStack(
        axis: .horizontal,
        alignment: .center,
        distribution: .fillProportionally,
        isSkeletonable: true
    )
    
    private lazy var favoriteImage = ImageFactory.createImage(
        contentMode: .scaleAspectFill,
        cornerRadius: 0,
        imageNamed: UIImage(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        isSkeletonable: true
    )
    
    private lazy var shareImage = ImageFactory.createImage(
        contentMode: .scaleAspectFit,
        cornerRadius: 0,
        imageNamed: UIImage(systemName: "square.and.arrow.up")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        isSkeletonable: true
    )

    private lazy var moreImage = ImageFactory.createImage(
        contentMode: .scaleAspectFit,
        cornerRadius: 0,
        imageNamed: UIImage(named: "optionsIcon"),
        isSkeletonable: true
    )
    
    private lazy var playPauseImage = ImageFactory.createImage(
        width: 56,
        height: 56,
        cornerRadius: 0,
        imageNamed: UIImage(named: "playImage"),
        isSkeletonable: true
    )
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupViews
    private func setupViews() {
        
        [albumCover, albumInfoStack, albumActionStack].forEach {
            contentView.addSubview($0)
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
        
        artistCover.layer.cornerRadius = artistCover.frame.size.width / 2
        
        albumCover.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        albumInfoStack.snp.makeConstraints { make in
            make.top.equalTo(albumCover.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
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
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        albumIconStack.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(100)
            
        }
        playPauseImage.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        favoriteImage.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        shareImage.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        moreImage.snp.makeConstraints { make in
            make.width.equalTo(18)
            make.height.equalTo(30)
        }
    }
    
    
}
