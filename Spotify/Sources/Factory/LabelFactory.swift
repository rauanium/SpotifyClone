//
//  LabelFactory.swift
//  Spotify
//
//  Created by rauan on 3/19/24.
//

import UIKit

final class LabelFactory {
    static func createLabel(
        text: String? = nil,
        font: UIFont? = UIFont.systemFont(ofSize: 16),
        textColor: UIColor? = .white,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = 0,
        height: CGFloat = 20,
        isSkeletonable: Bool = false,
        sekeletonCornerRadius: Float = 2
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.bounds.size.height = height
        label.isSkeletonable = isSkeletonable
        label.skeletonCornerRadius = sekeletonCornerRadius
        return label
    }
}
