//
//  AuthRepositoryProtocol.swift
//  Spotify
//
//  Created by rauan on 3/20/24.
//

import Foundation

protocol AuthRepositoryProtocol {
    func save(accessToken: String)
    func getAccessToken() -> String?
    func removeAccessToken()
    func removeAllTokens()
}
