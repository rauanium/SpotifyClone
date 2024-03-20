//
//  SupportedLanguages.swift
//  Spotify
//
//  Created by rauan on 3/19/24.
//

import Foundation

enum SupportedLanguages: String{
    case ru
    case en
    
    static var allLanguages: [SupportedLanguages] {
        return [.ru, .en]
    }
    
    var localizedTitle: String {
        switch self {
        case .ru:
            return "Русский"
        case .en:
            return "English"
        }
    }
    
}
