//
//  SectionHeaderView.swift
//  Spotify
//
//  Created by rauan on 3/14/24.
//


import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.systemFont(ofSize: 15)
        headerLabel.textColor = .white
        return headerLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(2)
        }
    }
    
    func configure(headerLabel: String) {
        self.headerLabel.text = headerLabel
    }
}
