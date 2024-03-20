//
//  ImageFactory.swift
//  Spotify
//
//  Created by rauan on 3/20/24.
//

import UIKit

final class ImageFactory {
    static func createImage(
        contentMode: UIView.ContentMode = .scaleAspectFill,
        clipsToBounds: Bool = true,
        width: CGFloat = 24,
        height: CGFloat = 24,
        cornerRadius: CGFloat = 4,
        imageNamed: UIImage? = nil,
        isSkeletonable: Bool = false,
        sekeletonCornerRadius: Float = 2
    ) -> UIImageView {
        let image = UIImageView()
        image.contentMode = contentMode
        image.clipsToBounds = clipsToBounds
        image.frame.size.width = width
        image.frame.size.height = height
        image.layer.cornerRadius = cornerRadius
        
        image.image = imageNamed
        image.isSkeletonable = isSkeletonable
        image.skeletonCornerRadius = sekeletonCornerRadius
        return image
    }
}

