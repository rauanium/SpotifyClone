//
//  CategoriesTarget.swift
//  Spotify
//
//  Created by rauan on 4/1/24.
//

import Foundation
import Moya

enum CategoriesTarget {
    case getCategories
    case getCategoryPlaylists(categoryID: String)
}

extension CategoriesTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: GlobalConstants.albumsAndPlaylistsBaseURL)!
    }
    
    var path: String {
        switch self {
        case .getCategories:
            return "/v1/browse/categories"
        case .getCategoryPlaylists(let categoryID):
            return "/v1/browse/categories/\(categoryID)/playlists"
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getCategories:
            return .requestParameters(parameters: ["limit" : 20,
                                                "offset": 0],
                                    encoding: URLEncoding.default)
        case .getCategoryPlaylists:
            return .requestParameters(parameters: 
                                        ["limit" : 20,
                                         "offset": 0],
                                      encoding: URLEncoding.default)
        }
        
    }
    
    var headers: [String : String]? {
        var header = [String: String]()
        AuthManager.shared.withValidToken { token in
            header["Authorization"] = "Bearer \(token)"
        }
        return header
    }
}
