//
//  SearchResultsCollectionViewCell.swift
//  Spotify
//
//  Created by rauan on 4/3/24.
//

import UIKit

class SearchResultsCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchResultsCollectionViewCell"
    
    private var coverImage = ImageFactory.createImage(
        imageNamed: UIImage(named: "cover4"))
    
    private var stackInfo = StackFactory.createStack(
    )
    
    private var title = LabelFactory.createLabel(
        text: "Donda")
    
    private var artist = LabelFactory.createLabel(
        text: "Kendrik Lamar",
        textColor: .subtitle
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [coverImage, stackInfo].forEach {
            contentView.addSubview($0)
        }
        contentView.addSubview(title)
        
        [title, artist].forEach {
            stackInfo.addArrangedSubview($0)
        }
        
        coverImage.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.width.equalTo(50)
            
        }
        
        stackInfo.snp.makeConstraints { make in
            make.left.equalTo(coverImage.snp.right).offset(12)
            make.centerY.equalTo(coverImage.snp.centerY)
        }
        
    }
    
    func configure(data: SearchResultsDataModel) {
        let imageURL = data.image
        coverImage.kf.setImage(with: imageURL)
        title.text = data.title
        artist.text = data.arist
        
    }
    
    
}
