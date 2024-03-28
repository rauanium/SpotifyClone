//
//  RecommendedCollectionViewCell.swift
//  Spotify
//
//  Created by rauan on 3/7/24.
//

import UIKit
import Kingfisher
import SkeletonView

class RecommendedCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    private enum Consraints {
        static let coverImageSize: CGFloat = 48
        static let coverImageCornerRadius: CGFloat = 24
        static let titleStackViewSpacing: CGFloat = 2
        static let optionsIconHeight: CGFloat = 24
        static let optionsIconWidth: CGFloat = 22
    }
    
    private lazy var coverImage: UIImageView = {
        let coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFill
        coverImage.frame.size.width = Consraints.coverImageSize
        coverImage.frame.size.height = Consraints.coverImageSize
        coverImage.clipsToBounds = true
        coverImage.layer.cornerRadius = coverImage.frame.width / 2
        coverImage.isSkeletonable = true
        return coverImage
    }()
    
    private lazy var titleAndSubtitleStackView: UIStackView = {
        let titleAndSubtitleStackView = UIStackView()
        titleAndSubtitleStackView.axis = .vertical
        titleAndSubtitleStackView.spacing = 2
        titleAndSubtitleStackView.alignment = .fill
        titleAndSubtitleStackView.distribution = .fillEqually
        titleAndSubtitleStackView.isSkeletonable = true
        titleAndSubtitleStackView.skeletonCornerRadius = 4
        return titleAndSubtitleStackView
    }()
    
    private lazy var coverTitle = LabelFactory.createLabel(
        numberOfLines: 1,
        isSkeletonable: true)
    
    private lazy var coverSubtitle = LabelFactory.createLabel(
        font: UIFont.systemFont(ofSize: 13),
        textColor: .subtitle,
        numberOfLines: 1,
        isSkeletonable: true)
    
    private lazy var optionsIcon: UIImageView = {
        let optionsIcon = UIImageView()
        optionsIcon.image = UIImage(named: "optionsIcon")
        optionsIcon.contentMode = .scaleAspectFit
        return optionsIcon
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImage.image = nil
        coverTitle.text = nil
        coverSubtitle.text = nil
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
        
        [coverImage, titleAndSubtitleStackView, optionsIcon].forEach {
            contentView.addSubview($0)
        }
        
        [coverTitle, coverSubtitle].forEach {
            titleAndSubtitleStackView.addArrangedSubview($0)
        }
        contentView.backgroundColor = .mainBackground
        
        coverImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(8)
            make.size.equalTo(Consraints.coverImageSize)
        }
        titleAndSubtitleStackView.snp.makeConstraints { make in
            make.left.equalTo(coverImage.snp.right).offset(12)
            make.top.bottom.equalTo(coverImage)
            make.height.greaterThanOrEqualTo(35)
            make.width.lessThanOrEqualTo(250)
        }
        
        optionsIcon.snp.makeConstraints { make in
            make.centerY.equalTo(coverImage.snp.centerY)
            make.right.equalToSuperview().inset(8)
            make.width.equalTo(Consraints.optionsIconWidth)
            make.height.equalTo(Consraints.optionsIconHeight)
        }
    }
    
    //MARK: - Configure cell
    func configure(with data: RecomendedModel) {
        let imageURL = data.coverImage
        coverImage.kf.setImage(with: imageURL)
        coverTitle.text = data.coverTitle
        guard let subtitle = data.coverSubtitle else {
            coverSubtitle.isHidden = true
            return
        }
        coverSubtitle.text = subtitle
    }
    
    
}
