//
//  LocalizationManager.swift
//  Spotify
//
//  Created by rauan on 3/19/24.
//

import Foundation

extension Bundle {
    private static var bundle: Bundle?
    
    public static func localizedBundle() -> Bundle? {
        if bundle == nil {
            let appLanguage = UserDefaults.standard.string(forKey: "appLanguage") ?? "en"
            let path = Bundle.main.path(forResource: appLanguage, ofType: "lproj")
            guard let path else { return nil }
            bundle = Bundle(path: path)
        }
        return bundle
    }
    
    public static func setLanguages(language: String) {
        UserDefaults.standard.set(language, forKey: "appLanguage")
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        guard let path else { return }
        bundle = Bundle(path: path)
    }
    
}
