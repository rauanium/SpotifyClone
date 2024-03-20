//
//  String+Extension.swift
//  Spotify
//
//  Created by rauan on 3/17/24.
//

import Foundation
extension String {
    var localized: String {
        guard let localizedBundle = Bundle.localizedBundle() else { return "" }
        return NSLocalizedString(
            self,
            bundle: localizedBundle,
            comment: "\(self) could not be Localizable.strings")
    }
}
