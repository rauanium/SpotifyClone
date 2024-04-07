//
//  CategoryPlaylistsCollectionViewCell.swift
//  Spotify
//
//  Created by rauan on 4/5/24.
//

import UIKit
import Kingfisher
import SkeletonView

class CategoryPlaylistsCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryPlaylistsCollectionViewCell"
    
    //MARK: - Properties
    private let coverImage: UIImageView = {
        let coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFill
        coverImage.clipsToBounds = true
        coverImage.layer.cornerRadius = 4
        coverImage.isSkeletonable = true
        coverImage.skeletonCornerRadius = 4
        return coverImage
    }()
    
    private let coverTitle: UILabel = {
        let coverTitle = UILabel()
        coverTitle.textColor = .white
        coverTitle.font = UIFont.systemFont(ofSize: 15)
        coverTitle.textAlignment = .left
        coverTitle.numberOfLines = 2
        coverTitle.isSkeletonable = true
        coverTitle.skeletonCornerRadius = 4
        return coverTitle
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImage.image = nil
        coverTitle.text = nil
        if contentView.sk.isSkeletonActive {
            isSkeletonable = false
            contentView.isSkeletonable = false
            contentView.hideSkeleton()
        }
    }
    
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
        isSkeletonable = true
        contentView.isSkeletonable = true
        
        contentView.backgroundColor = .clear
        contentView.clipsToBounds = true
        [coverImage, coverTitle].forEach{
            contentView.addSubview($0)
        }
        
//        contentView.addSubview(coverTitle)
//        contentView.snp.makeConstraints { make in
//            make.height.equalTo(200)
//            make.width.equalTo(160)
//        }
        
        coverImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(152)
            make.width.equalTo(152)
        }
        
        coverTitle.snp.makeConstraints { make in
            make.top.equalTo(coverImage.snp.bottom).offset(8)
            make.left.equalToSuperview()
            make.height.lessThanOrEqualTo(40)
            make.width.equalToSuperview()
        }
    }

    //MARK: - Configure cell
    func configure(data: CategoryPlaylistsModel) {
        let imageURL = URL(string: data.image)
        coverImage.kf.setImage(with: imageURL)
        coverTitle.text = data.title
    }
    
}

