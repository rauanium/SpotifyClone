//
//  StackFactory.swift
//  Spotify
//
//  Created by rauan on 3/20/24.
//

import UIKit

final class StackFactory {
    static func createStack(
        axis: NSLayoutConstraint.Axis = .vertical,
        spacing: CGFloat = 2,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fillEqually,
        isSkeletonable: Bool = false,
        sekeletonCornerRadius: Float = 2
    ) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.spacing = spacing
        stack.alignment = alignment
        stack.distribution = distribution
        stack.isSkeletonable = isSkeletonable
        stack.skeletonCornerRadius = sekeletonCornerRadius
        return stack
    }
}

