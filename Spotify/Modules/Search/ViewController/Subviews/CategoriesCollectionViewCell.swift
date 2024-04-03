//
//  CategoriesCollectionViewCell.swift
//  Spotify
//
//  Created by rauan on 3/31/24.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCollectionViewCell"
    
    private lazy var categoryTitle = LabelFactory.createLabel(
        text: "Lo-Fi",
        font: UIFont.systemFont(ofSize: 17, weight: .bold),
        textColor: .white,
        textAlignment: .left,
        numberOfLines: 0,
        height: 80,
        isSkeletonable: true,
        sekeletonCornerRadius: 2
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(categoryTitle)
        
        contentView.layer.cornerRadius = 4
        
        categoryTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    func configure(data: CategorySectionModel) {
        categoryTitle.text = data.categoryTitle
        contentView.backgroundColor = data.color
    }
    
    
    
}
