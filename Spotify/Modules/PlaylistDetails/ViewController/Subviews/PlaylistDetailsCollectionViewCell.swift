//
//  PlaylistDetailsCollectionViewCell.swift
//  Spotify
//
//  Created by rauan on 3/22/24.
//

import UIKit

class PlaylistDetailsCollectionViewCell: UICollectionViewCell {
    static let identifier = "songCell"
    
    private lazy var songNumberLabel = LabelFactory.createLabel(
        text: "1",
        font: UIFont.systemFont(ofSize: 13, weight: .bold),
        textColor: .subtitle,
        numberOfLines: 1,
        isSkeletonable: true
    )
    
    private lazy var songTitleStack = StackFactory.createStack(
        spacing: 4,
        alignment: .fill,
        distribution: .fillProportionally,
        isSkeletonable: true
    )
    
    private lazy var songTitleLabel = LabelFactory.createLabel(
        text: "All the stars",
        font: UIFont.systemFont(ofSize: 15),
        textColor: .white,
        numberOfLines: 1,
        isSkeletonable: true
    )
    
    private lazy var songArtistLabel = LabelFactory.createLabel(
        text: "Kendrik Lamar",
        font: UIFont.systemFont(ofSize: 13),
        textColor: .subtitle,
        numberOfLines: 1,
        isSkeletonable: true
    )
    
    private lazy var optionIcon = ImageFactory.createImage(
        contentMode: .scaleAspectFit,
        width: 30,
        height: 30,
        cornerRadius: 0,
        imageNamed: UIImage(named: "optionsIcon"),
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
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        songNumberLabel.text = nil
//        songTitleLabel.text = nil
//        songArtistLabel.text = nil
//
//    }
    
    //MARK: - SettingUp Cell
    private func setupViews() {
        [songNumberLabel, songTitleStack, optionIcon].forEach {
            contentView.addSubview($0)
        }
        
        [songTitleLabel, songArtistLabel].forEach {
            songTitleStack.addArrangedSubview($0)
        }
        
        songNumberLabel.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.height.equalTo(70)
        }
        
        songTitleStack.snp.makeConstraints { make in
            make.centerY.equalTo(songNumberLabel)
            make.left.equalTo(songNumberLabel.snp.right).offset(20)
        }
        optionIcon.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.centerY.equalTo(songTitleLabel).inset(8)
        }
        
    }
    
    
    func configure(data: PlaylistSongDetailsDataModel, index: Int) {
        songNumberLabel.text = "\(index)"
        songTitleLabel.text = data.songTitle
        songArtistLabel.text = data.songArtist
        
    }
    
}

