//
//  String+Extension.swift
//  Spotify
//
//  Created by rauan on 3/17/24.
//

import Foundation
extension String {
    var localized: String {
        NSLocalizedString(self, comment: "\(self) could not be Localizable.strings")
    }
}
