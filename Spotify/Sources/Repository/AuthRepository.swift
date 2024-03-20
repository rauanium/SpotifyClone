//
//  AuthRepository.swift
//  Spotify
//
//  Created by rauan on 3/20/24.
//

import Foundation
import SwiftKeychainWrapper

final class AuthRepository: AuthRepositoryProtocol {
    private enum Constants {
        static var accessTokenKey = "accessToken"
    }
    
    private var keychainWrapper: KeychainWrapper = .standard
    
    func save(accessToken: String) {
        keychainWrapper.set(accessToken, forKey: Constants.accessTokenKey)
    }
    
    func getAccessToken() -> String? {
        keychainWrapper.string(forKey: Constants.accessTokenKey)
    }
    
    func removeAccessToken() {
        keychainWrapper.removeObject(forKey: Constants.accessTokenKey)
    }
    
    func removeAllTokens() {
        keychainWrapper.removeObject(forKey: Constants.accessTokenKey)
    }
}
